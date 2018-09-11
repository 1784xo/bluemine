package com.bluemine;


import com.bluemine.config.ApplicationConfiguration;
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
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

/**
 * Created by hechao on 2018/6/25.
 */
@ComponentScan
@EnableAsync
@EnableAutoConfiguration
@EnableBatchProcessing
@EnableScheduling
@EnableConfigurationProperties(ApplicationConfiguration.class)
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
            String configFile = env.getProperty(ServerConstants.CONFIG_FILE);
            String address = InetAddress.getLocalHost().getHostAddress();
            if (log.isInfoEnabled()) {
                log.info("\n---------------------------------------------------------------------\n" +
                                "\tCluster Id : {}\n" +
                                "\tServer Id : {}\n" +
                                "\tServer IP : {}\n" +
                                "\tConfig File : {}\n" +
                                "\tSpring Profiles : {}\n" +
                                "\tRuntime : {}\n"
                        , clusterId
                        , serverId
                        , address
                        , configFile
                        , env.getActiveProfiles()
                        , LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            }
            contextInitialized(ApplicationConfiguration.class, applicationContext);

        } catch (NumberFormatException nfex) {
            throw new IllegalArgumentException();
        } catch (UnknownHostException uhex) {
            throw new IllegalArgumentException();
        }
    }

    /**
     * VM options add "-Dconfig.file=$APP_HOME\config\application.properties"
     *
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
        String configFile = System.getProperty(ServerConstants.CONFIG_FILE);
        if (configFile != null || !configFile.equals("") || configFile.length() > 0) {
            SpringApplication application = new SpringApplication(Bootstrap.class);
            FileInputStream inputStream = null;

            inputStream = new FileInputStream(configFile);
            Properties properties = new Properties();
            properties.load(inputStream);
            application.setDefaultProperties(properties);
            application.run(args);

            if (inputStream != null) {
                inputStream.close();
            }

        } else {
            SpringApplication.run(Bootstrap.class, args);
        }
    }
}
