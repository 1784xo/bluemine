import com.bluemine.Bootstrap;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by hechao on 2018/7/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Bootstrap.class)
public class CallCollectJobTest {

//    @Inject
//    private CallCollectService callCollectService;

    @Test
    public void test() throws JobParametersInvalidException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException {
//        callCollectService.run("100001", "101", "2018-07-01", "2");
//        callCollectService.run("100001", "102", "2018-07-01", "2");
//        callCollectService.run("100001", "103", "2018-07-01", "2");
//        callCollectService.run("100001", "104", "2018-07-04", "2");
//        callCollectService.run("100001", "105", "2018-07-25", "2");
//        callCollectService.run("100001", "107", "2018-07-29", "2");

//        for (int i = 1, l = 31; i <= l; i++) {
//            callCollectService.run("100001", "1000" + i, "2018-07-" + (i < 10 ? "0" + i : i), "2");
//        }
    }
}
