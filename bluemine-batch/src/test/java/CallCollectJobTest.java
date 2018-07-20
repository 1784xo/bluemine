import com.bluemine.Bootstrap;
import com.bluemine.batch.service.CallCollectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/7/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Bootstrap.class)
public class CallCollectJobTest {

    @Inject
    private CallCollectService callCollectService;

    @Test
    public void test() throws JobParametersInvalidException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException {
        callCollectService.run("100001", "20", "2018-07-21", "2");
    }
}
