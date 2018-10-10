package com.bluemine.job.tag;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.SolrResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.*;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.job.CallFieldSetMapper;
import com.bluemine.job.CallItem;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.RuleRepository;
import com.bluemine.repository.SeatRepository;
import com.bluemine.repository.TagRepository;
import com.bluemine.solr.RuleResolver;
import com.bluemine.solr.SolrHttpClient;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.JobScope;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.mapping.DefaultLineMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.*;

/**
 * Created by hechao on 2018/10/8.
 */
@Configuration
public class TagCollectJobConfiguration implements ItemProcessor<CallItem, SessionContext>
        , ItemWriter<SessionContext> {
    public static final String PARAM_CHANNEL_ID = "channelId";

    public static final String PARAM_CALL_DATE = "callDate";

    public static final String PARAM_CALL_RESOURCE = "resource";

    @Inject
    private StepBuilderFactory stepBuilderFactory;

    @Inject
    private JobBuilderFactory jobBuilderFactory;

    @Inject
    private SolrHttpClient solrHttpClient;

    @Inject
    private Cache localCache;

    @Inject
    private TagRepository tagRepository;

    @Inject
    private RuleRepository ruleRepository;

    @Inject
    private SeatRepository seatRepository;

    @Inject
    private ChannelRepository channelRepository;

    @Bean
    public Job tagCollectJob(Step tagCollectStep) throws Exception {
        return jobBuilderFactory.get("tagCollectJob")
                .incrementer(new RunIdIncrementer())
                .start(tagCollectStep)
                .build();
    }

    @Bean
    @JobScope
    public Step tagCollectStep(@Value("#{jobParameters[channelId]}") Long channelId
            , @Value("#{jobParameters[callDate]}") Date callDate
            , @Value("#{jobParameters[resource]}") String file) throws Exception {

        ChannelEntity channelEntity = channelRepository.findOne(channelId);
        AssertUtils.notNull(channelEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "channel", channelId);
        CallFieldSetMapper fieldSetMapper = new CallFieldSetMapper(channelEntity, callDate);

        List<TagEntity> tagList = tagRepository.findAll(channelId, true, TagRepository.ORDER_TAG_NO_ASC);
        List<RuleEntity> ruleList = ruleRepository.findAllByChannelId(channelId);
        Map<Long, TagResponse> tagMap = EntityUtils.mergeToMap(tagList, ruleList);
        localCache.put(channelId, tagMap);

        return stepBuilderFactory.get("tagCollectStep")
                .chunk(1)
                .reader(callItemReader(fieldSetMapper, file))
                .processor((ItemProcessor) this)
                .writer((ItemWriter) this)
                .build();
    }

    public ItemReader<CallItem> callItemReader(CallFieldSetMapper fieldSetMapper, String file) throws Exception {

        DefaultLineMapper lineMapper = new DefaultLineMapper();
        lineMapper.setFieldSetMapper(fieldSetMapper);

        DelimitedLineTokenizer lineTokenizer = new DelimitedLineTokenizer();
        lineTokenizer.setNames(new String[]{"callNo", "seatNo"});
        lineMapper.setLineTokenizer(lineTokenizer);

        FlatFileItemReader<CallItem> reader = new FlatFileItemReader<>();
        reader.setResource(new FileSystemResource(file));
        reader.setLineMapper(lineMapper);

        return reader;
    }

    @Override
    public SessionContext process(CallItem item) throws Exception {

        String callNo = item.getCallNo();
        LocalDate callDate = item.getCallLocalDate();

        ChannelEntity channel = item.getChannel();
        long channelId = channel.getChannelId();

        Map<Long, TagResponse> tagMap = localCache.get(channelId, Map.class);
        Collection<TagResponse> collection = tagMap.values();

        String seatNo = item.getSeatNo();
        SeatEntity seat = findSeat(channelId, seatNo, SeatEntity.class);

        int frequency;
        List<RuleResponse> rules;
        Stack<TagCollectEntity> venation;
        Set<TagCollectEntity> collects = new HashSet<>();
        SessionContext context = new SessionContext();

        for (TagResponse tag : collection) {
            venation = veins(channelId, callNo, callDate, tag, tagMap, seat, context);
            if ((venation != null) && (venation.size() > 0)) {
                rules = tag.getRules();
                for (RuleResponse rule : rules) {
                    SolrResponse solrResponse = solrHttpClient.getTagCollect(callNo, RuleResolver.resolve(rule.getRuleExps()));
                    frequency = solrResponse.getResponse().getNumFound();
                    if (frequency > 0) {
                        collects.addAll(collect(tag, venation, rule, frequency));
                        continue;
                    }
                }
            }
        }

        context.getRepository().push(collects);
        return context;
    }

    private SeatEntity findSeat(long channelId, String seatNo, Class<SeatEntity> cls) {
        String name = channelId + "-" + seatNo;
        SeatEntity seat = localCache.get(name, cls);
        if (seat == null) {
            seat = seatRepository.findOneByChannelIdAndSeatNo(channelId, seatNo);
            AssertUtils.notNull(seat, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "seat", channelId + ", " + seatNo);
            localCache.put(name, seat);
        }
        return seat;
    }

    private void query(ChannelEntity channel) {

    }

    private static Stack<TagCollectEntity> veins(
            long channelId, String callNo, LocalDate callDate
            , TagResponse tag, Map<Long, TagResponse> tags
            , SeatEntity seat, SessionContext context) {
        if (!tag.getActivated()) {
            return null;
        }
        Map<Long, TagCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getId();
        TagCollectEntity tagCollect = createTabCollect(channelId, callNo, callDate, tag, seat, context);
        venation.put(tagId, tagCollect);
        Long parentId = tag.getParentId();
        TagCollectEntity parentCollect;
        TagResponse parentTag;
        while ((parentId != null) && (parentId.compareTo(0L) > 0)) {
            parentTag = tags.get(parentId);
            if ((parentTag == null) || (!parentTag.getActivated())) {
                venation.clear();
                return null;
            }
            parentCollect = createTabCollect(channelId, callNo, callDate, parentTag, seat, context);
            venation.put(parentId, parentCollect);
            parentId = parentTag.getParentId();
        }

        Stack<TagCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
    }

    private static TagCollectEntity createTabCollect(long channelId, String callNo, LocalDate callDate
            , TagResponse tag, SeatEntity seat, SessionContext context) {

        IdWorker idWorker = context.getIdWorker();
        TagCollectEntity entity = (TagCollectEntity) new TagCollectEntity()
                .collectId(idWorker.nextId())
                .channelId(channelId)
                .callNo(callNo)
                .tagId(tag.getId())
                .ruleId(0L)
                .parentId(tag.getParentId())
                .tagText(tag.getText())
                .callDate(callDate)
                .callYear(callDate.getYear())
                .callMonth(callDate.getMonthValue())
                .callDay(callDate.getDayOfMonth())
                .callWeek(callDate.getYear() * 100 + callDate.get(WeekFields.ISO.weekOfWeekBasedYear()))
                .seatId(seat.getSeatId())
                .frequency(0)
                .subFrequency(0)
                .totleFrequency(0)
                .subTotal(0)
                .partitionKey(seat.getPartitionKey());
        return entity;
    }

    private static List<TagCollectEntity> collect(TagResponse tag, Stack<TagCollectEntity> venation, RuleResponse rule, int frequency) {
        TagCollectEntity tagCollect;
        List<TagCollectEntity> collects = new LinkedList<>();
        while (!venation.empty()) {
            tagCollect = venation.pop();
            tagCollect.ruleId(rule.getRuleId()).callType(rule.getCallType()).roleType(rule.getRoleType()).totleFrequency(tagCollect.getTotleFrequency() + frequency);
            if (tagCollect.getTagId().compareTo(tag.getId()) == 0) {
                tagCollect.frequency(frequency).ruleExps(rule.getRuleExps());
            } else {
                tagCollect.subTotal(tagCollect.getSubTotal() + 1)
                        .subFrequency(tagCollect.getSubFrequency() + frequency);
            }
            collects.add(tagCollect);
        }
        return collects;
    }

    @Override
    public void write(List<? extends SessionContext> list) throws Exception {
        for (SessionContext context : list) {
            context.getRepository().commit();
        }
    }

}
