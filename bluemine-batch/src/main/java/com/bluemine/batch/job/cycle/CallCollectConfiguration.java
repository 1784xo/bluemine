package com.bluemine.batch.job.cycle;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.batch.item.SimpleItemReader;
import com.bluemine.batch.service.CallCollectService;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.Call;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.SeatEntity;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.SeatRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.AssertUtils;
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
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.inject.Inject;
import java.util.Collection;
import java.util.List;

/**
 * Created by hechao on 2018/7/2.
 */
@Configuration
public class CallCollectConfiguration implements ItemProcessor<Call, SessionContext>, ItemWriter<SessionContext> {

    public static final String PARAM_CHANNEL_NO = "channelNo";

    public static final String PARAM_SEAT_NO = "seatNo";

    public static final String PARAM_CALL_NO = "callNo";

    public static final String PARAM_CALL_DATE = "callDate";

    public static final String TRIGGER_TYPE = "CALL";

    @Inject
    private JobBuilderFactory jobBuilderFactory;

    @Inject
    private StepBuilderFactory stepBuilderFactory;

    @Inject
    private CallCollectService callCollectService;

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private SeatRepository seatRepository;

    @Bean
    public Job callCollectJob(Step callCollectStep) throws Exception {
        return jobBuilderFactory.get("callCollectJob")
                .incrementer(new RunIdIncrementer())
                .start(callCollectStep)
                .build();
    }

    @Bean
    @JobScope
    public Step callCollectStep(@Value("#{jobParameters[channelNo]}") String channelNo
            , @Value("#{jobParameters[callNo]}") String callNo
            , @Value("#{jobParameters[callDate]}") String callDate
            , @Value("#{jobParameters[seatNo]}") String seatNo) throws Exception {

        return stepBuilderFactory.get("callCollectStep")
                .chunk(1)
                .reader(callCollectReader(channelNo, callNo, callDate, seatNo))
                .processor((ItemProcessor) this)
                .writer((ItemWriter) this)
                .build();
    }

    public ItemReader<Call> callCollectReader(@Value("#{jobParameters[channelNo]}") String channelNo
            , @Value("#{jobParameters[callNo]}") String callNo
            , @Value("#{jobParameters[callDate]}") String callDate
            , @Value("#{jobParameters[seatNo]}") String seatNo) throws Exception {

        ChannelEntity channelEntity = channelRepository.findOneByChannelNo(channelNo);
        AssertUtils.notNull(channelEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        SeatEntity seatEntity = seatRepository.findOneByChannelIdAndSeatNo(channelEntity.getChannelId(), seatNo);
        AssertUtils.notNull(seatEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        Call call = new Call()
                .channel(channelEntity)
                .seat(seatEntity)
                .callNo(callNo)
                .callDate(callDate);

        SimpleItemReader<Call> reader = new SimpleItemReader<>(call);

        return reader;
    }

    @Override
    public void write(List<? extends SessionContext> list) throws Exception {
        for (SessionContext context : list) {
            context.getRepository().commit();
        }
//        new Integer(null);
    }

    @Override
    public SessionContext process(Call call) throws Exception {
        SessionContext context = new SessionContext();
        Collection<TagCollectEntity> collect = callCollectService.collect(call, context);
        RepositoryProxy repository = context.getRepository();
        repository.push(collect);
        return context;
    }
}
