package com.bluemine.job.tag;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.entity.SeatEntity;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.domain.entity.TagEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.job.CallFieldSetMapper;
import com.bluemine.job.CallItem;
import com.bluemine.job.call.TagCollectItem;
import com.bluemine.repository.RuleRepository;
import com.bluemine.repository.SeatRepository;
import com.bluemine.repository.TagRepository;
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
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
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
    private Cache tagCache;

    @Inject
    private TagRepository tagRepository;

    @Inject
    private RuleRepository ruleRepository;

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
            , @Value("#{jobParameters[callDate]}") Date callDate
            , @Value("#{jobParameters[resource]}") String file) throws Exception {

        List<TagEntity> tagList = tagRepository.findAll(channelId, true, TagRepository.ORDER_TAG_NO_ASC);
        List<RuleEntity> ruleList = ruleRepository.findAllByChannelId(channelId);
        Map<Long, TagResponse>  tagMap = EntityUtils.mergeToMap(tagList, ruleList);
        tagCache.put(channelId, tagMap);

        return stepBuilderFactory.get("tagCollectStep")
                .chunk(1)
                .reader(callItemReader(channelId, callDate, file))
                .processor((ItemProcessor) this)
                .writer((ItemWriter) this)
                .build();
    }

    public ItemReader<CallItem> callItemReader(Long channelId, Date callDate, String file) throws Exception {
        DefaultLineMapper lineMapper = new DefaultLineMapper();
        DelimitedLineTokenizer lineTokenizer = new DelimitedLineTokenizer();
        lineTokenizer.setNames(new String[]{"callNo", "seatNo"});
        lineMapper.setLineTokenizer(lineTokenizer);

        CallFieldSetMapper fieldSetMapper = new CallFieldSetMapper(channelId, callDate);
        lineMapper.setFieldSetMapper(fieldSetMapper);

        FlatFileItemReader<CallItem> reader = new FlatFileItemReader<>();
        reader.setResource(new FileSystemResource(file));
        reader.setLineMapper(lineMapper);

        return reader;
    }

    @Override
    public SessionContext process(CallItem item) throws Exception {

        long channelId = item.getChannelId();
        Map<Long, TagResponse> tagMap = tagCache.get(channelId, Map.class);
        Collection<TagResponse> collection = tagMap.values();

        String seatNo = item.getSeatNo();
        SeatEntity seatEntity = seatRepository.findOneByChannelIdAndSeatNo(channelId, seatNo);
        AssertUtils.notNull(seatEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "seat", channelId+", "+seatNo);

        int frequency;
        List<RuleResponse> rules;
        Stack<TagCollectEntity> venation;
        Set<TagCollectEntity> collects = new HashSet<>();
        SessionContext context = new SessionContext();

        for (TagResponse tag : collection) {
            venation = vein(tag, tagMap, item, seatEntity, context);
            if ((venation != null) && (venation.size() > 0)) {
                rules = tag.getRules();
                for (RuleResponse rule : rules) {
//                    SolrResponse solrResponse = solrHttpClient.getTagCollect(item.getCallNo(), RuleResolver.resolve(rule.getRuleExps()));
//                    frequency = solrResponse.getResponse().getNumFound();
//                    if (frequency > 0) {
//                        collects.addAll(collect(tag, venation, rule, frequency));
//                        continue;
//                    }
                }
            }
        }

        return null;
    }

    private static Stack<TagCollectEntity> vein(TagResponse tag, Map<Long, TagResponse> tags, CallItem item, SeatEntity seat, SessionContext context) {
        if (!tag.getActivated()) {
            return null;
        }
        Map<Long, TagCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getId();
        TagCollectEntity tagCollect = createTabCollect(tag, item, seat, context);
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
            parentCollect = createTabCollect(parentTag, item, seat, context);
            venation.put(parentId, parentCollect);
            parentId = parentTag.getParentId();
        }

        Stack<TagCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
    }

    private static TagCollectEntity createTabCollect(TagResponse tag, CallItem item, SeatEntity seat, SessionContext context) {
        long channelId = item.getChannelId();
        String callNo = item.getCallNo();
        LocalDate callDate = LocalDate.from(item.getCallDate().toInstant());

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


    @Override
    public void write(List<? extends SessionContext> list) throws Exception {

    }

}
