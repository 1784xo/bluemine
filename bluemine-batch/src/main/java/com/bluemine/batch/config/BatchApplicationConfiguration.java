package com.bluemine.batch.config;


import com.bluemine.config.BootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Created by hechao on 2017/11/23.
 */
@ConfigurationProperties(prefix = "bluemine", ignoreUnknownFields = false)
public class BatchApplicationConfiguration extends BootConfiguration {

}
