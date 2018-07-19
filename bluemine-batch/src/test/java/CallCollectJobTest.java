import com.bluemine.Bootstrap;
import com.bluemine.batch.job.cycle.CallCollectConfiguration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/7/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Bootstrap.class)
public class CallCollectJobTest {

    @Inject
    private JobLauncher jobLauncher;

    @Inject
    private ApplicationContext applicationContext;

    @Test
    public void test() throws JobParametersInvalidException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException {
        Job callCollectJob = (Job) applicationContext.getBean("callCollectJob");
        JobParameters params = new JobParametersBuilder()
                .addString(CallCollectConfiguration.PARAM_CHANNEL_NO, "100001")
                .addString(CallCollectConfiguration.PARAM_SEAT_NO, "2")
                .addString(CallCollectConfiguration.PARAM_CALL_NO, "14")
                .addString(CallCollectConfiguration.PARAM_CALL_DATE, "2018-07-24")
                .toJobParameters();
        jobLauncher.run(callCollectJob, params);
        this.hashCode();
    }
}
