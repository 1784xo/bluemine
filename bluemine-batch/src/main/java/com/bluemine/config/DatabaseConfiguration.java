package com.bluemine.config;

import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by hechao on 2017/8/10.
 */
@Configuration
@EntityScan("com.bluemine.domain.entity")
@EnableJpaRepositories("com.bluemine.repository")
@EnableJpaAuditing(auditorAwareRef = "auditorAwareProxy")
@EnableTransactionManagement
public class DatabaseConfiguration {
    @Bean
    public Hibernate5Module hibernate5Module() {
        return new Hibernate5Module();
    }
}
