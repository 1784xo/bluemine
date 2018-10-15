import com.bluemine.Bootstrap;
import com.bluemine.job.CallBatchExecutor;
import com.bluemine.job.tag.TagCollectJobConfiguration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.*;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import javax.inject.Inject;
import java.time.ZoneId;
import java.util.Date;

/**
 * Created by hechao on 2018/7/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Bootstrap.class)
public class CallCollectJobTest {


    @Inject
    private ApplicationContext applicationContext;

    @Inject
    private JobLauncher jobLauncher;

//    @Inject
//    private CallCollectService callCollectService;

    @Inject
    private CallBatchExecutor callBatchExecutor;

    @Test
    public void test() throws JobParametersInvalidException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException {
//        callCollectService.run("100001", "101", "2018-07-01", "2");
//        callCollectService.run("100001", "102", "2018-07-01", "2");
//        callCollectService.run("100001", "103", "2018-07-01", "2");
//        callCollectService.run("100001", "104", "2018-07-04", "2");
//        callCollectService.run("100001", "105", "2018-07-25", "2");
//        callCollectService.run("100001", "107", "2018-07-29", "2");

        Job tagCollectJob = (Job) applicationContext.getBean("tagCollectJob");
        JobParameters params = new JobParametersBuilder()
                .addLong(TagCollectJobConfiguration.PARAM_CHANNEL_ID, 49252889384718336L)
                .addDate(TagCollectJobConfiguration.PARAM_CALL_DATE, new Date(2018-1900, 7 ,30, 0, 0, 0))
                .addString(TagCollectJobConfiguration.PARAM_CALL_RESOURCE, "E:\\workspace\\bluemine\\1.0.0\\bluemine-batch\\sync\\100001-20180830.log")
                .toJobParameters();
        JobExecution jobExecution = jobLauncher.run(tagCollectJob, params);

//        for (int i = 1, l = 31; i <= l; i++) {
//            callCollectService.run("100001", "1000" + i, "2018-07-" + (i < 10 ? "0" + i : i), "2");
//        }
    }
}
