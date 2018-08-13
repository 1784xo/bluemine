package com.bluemine;


import com.bluemine.config.BatchApplicationConfiguration;
import com.bluemine.context.ApplicationContextLoader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by hechao on 2018/6/25.
 */
@ComponentScan
@EnableBatchProcessing
@EnableAutoConfiguration
@EnableConfigurationProperties(BatchApplicationConfiguration.class)
public class Bootstrap extends ApplicationContextLoader {
    @Inject
    private Environment env;

    @Inject
    private ApplicationContext applicationContext;

    private static final Logger log = LoggerFactory.getLogger(Bootstrap.class);

    @PostConstruct
    public void initApplication() {
        try {
            String serverId = env.getProperty(ServerConstants.PROFILE_SERVER_ID);
            String clusterId = env.getProperty(ServerConstants.PROFILE_CLUSTER_ID);
            String address = InetAddress.getLocalHost().getHostAddress();
            if (log.isInfoEnabled()) {
                log.info("\n---------------------------------------------------------------------\n" +
                                "\tCluster Id : {}\n" +
                                "\tServer Id : {}\n" +
                                "\tServer IP : {}\n" +
                                "\tSpring Profiles : {}\n" +
                                "\tRuntime : {}\n"
                        , clusterId
                        , serverId
                        , address
                        , env.getActiveProfiles()
                        , LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            }
            contextInitialized(BatchApplicationConfiguration.class, applicationContext);

        } catch (NumberFormatException nfex) {
            throw new IllegalArgumentException();
        } catch (UnknownHostException uhex) {
            throw new IllegalArgumentException();
        }
    }

    public static void main(String[] args) {
        SpringApplication.run(Bootstrap.class, args);
    }
}
