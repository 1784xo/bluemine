package com.bluemine.job.call;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.SolrResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.SeatEntity;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.item.SimpleItemReader;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.SeatRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.inject.Inject;
import javax.persistence.EntityManagerFactory;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.*;

/**
 * Created by hechao on 2018/9/4.
 */
@Configuration
public class TagCollectJobConfiguration implements ItemProcessor<TagCollectItem, SessionContext>, ItemWriter<SessionContext> {

    public static final String PARAM_CHANNEL_ID = "channelId";

    public static final String PARAM_SEAT_NO = "seatNo";

    public static final String PARAM_CALL_NO = "callNo";

    public static final String PARAM_CALL_DATE = "callDate";

    @Inject
    private Cache tagCache;

    @Inject
    private SolrHttpClient solrHttpClient;

    @Inject
    private JobBuilderFactory jobBuilderFactory;

    @Inject
    private StepBuilderFactory stepBuilderFactory;

    @Inject
    private SeatRepository seatRepository;

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
            , @Value("#{jobParameters[callNo]}") String callNo
            , @Value("#{jobParameters[callDate]}") String callDate
            , @Value("#{jobParameters[seatNo]}") String seatNo) throws Exception {
        return stepBuilderFactory.get("tagCollectStep")
                .chunk(10)
                .reader(tagCollectReader(channelId, callNo, callDate, seatNo))
                .processor((ItemProcessor) this)
                .writer((ItemWriter) this)
                .build();
    }

    public ItemReader<TagCollectItem> tagCollectReader(Long channelId, String callNo, String callDate, String seatNo) throws Exception {

        SeatEntity seatEntity = seatRepository.findOneByChannelIdAndSeatNo(channelId, seatNo);
        AssertUtils.notNull(seatEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "seat", channelId+", "+seatNo);

        TagCollectItem item = new TagCollectItem();
        item.setChannelId(channelId);
        item.setSeat(seatEntity);
        item.setCallDate(LocalDate.parse(callDate));
        item.setCallNo(callNo);
        item.setPartitionKey(seatEntity.getPartitionKey());

        SimpleItemReader<TagCollectItem> reader = new SimpleItemReader<>(item);
        return reader;
    }

    @Override
    public SessionContext process(TagCollectItem item) throws Exception {
        Map<Long, TagResponse> tagMap = tagCache.get(item.getChannelId(), Map.class);
        AssertUtils.notNull(tagMap == null, ExceptionMessageEnum.NULL_EXCEPTION);

        SessionContext context = new SessionContext();
        Collection<TagResponse> tags = tagMap.values();

        int frequency;
        List<RuleResponse> rules;
        Stack<TagCollectEntity> venation;
        Set<TagCollectEntity> collects = new HashSet<>();

        for (TagResponse tag : tags) {
            venation = vein(tag, tagMap, item, context);
            if ((venation != null) && (venation.size() > 0)) {
                rules = tag.getRules();
                for (RuleResponse rule : rules) {
                    SolrResponse solrResponse = solrHttpClient.getTagCollect(item.getCallNo(), RuleResolver.resolve(rule.getRuleExps()));
                    frequency = solrResponse.getResponse().getNumFound();
                    if (frequency > 0) {
                        collects.addAll(collect(tag, venation, rule, frequency));
                        continue;
                    }
                }
            }
        }

        RepositoryProxy repository = context.getRepository();
        repository.push(collects);
        return context;
    }

    @Override
    public void write(List<? extends SessionContext> list) throws Exception {
        for (SessionContext context : list) {
            context.getRepository().commit();
        }
    }

    private static TagCollectEntity createTabCollect(TagResponse tag, TagCollectItem item, SessionContext context) {
        Long channelId = item.getChannelId();
        String callNo = item.getCallNo();
        LocalDate callDate = item.getCallDate();
        SeatEntity seat = item.getSeat();
        IdWorker idWorker = context.getIdWorker();

        TagCollectEntity entity = new TagCollectEntity()
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
                .subTotal(0);
        entity.setPartitionKey(item.getPartitionKey());
        return entity;
    }

    private static Stack<TagCollectEntity> vein(TagResponse tag, Map<Long, TagResponse> tags, TagCollectItem item
            , SessionContext context) {
        if (!tag.getActivated()) {
            return null;
        }
        Map<Long, TagCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getId();
        TagCollectEntity tagCollect = createTabCollect(tag, item, context);
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
            parentCollect = createTabCollect(parentTag, item, context);
            venation.put(parentId, parentCollect);
            parentId = parentTag.getParentId();
        }

        Stack<TagCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
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
}
