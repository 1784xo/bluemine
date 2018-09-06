package com.bluemine.config;

import org.apache.http.Header;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicHeader;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by hechao on 2018/9/6.
 */
@Configuration
public class SolrRestTemplateConfiguration {

    @Bean
    public HttpComponentsClientHttpRequestFactory solrHttpFactory() {
        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(30, TimeUnit.SECONDS);
        connectionManager.setMaxTotal(1000);
        connectionManager.setDefaultMaxPerRoute(1000);

        List<Header> headers = new ArrayList<Header>();
        headers.add(new BasicHeader("User-Agent", "Java/8(Apache HttpClient 4.5)"));
        headers.add(new BasicHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"));
        headers.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headers.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headers.add(new BasicHeader("Connection", "keep-alive"));

        HttpClient httpClient = HttpClientBuilder.create()
                .setConnectionManager(connectionManager)
                .setDefaultHeaders(headers)
                .setRetryHandler(new DefaultHttpRequestRetryHandler(3, true))
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .build();

        HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(httpClient);
        requestFactory.setConnectTimeout(5000);
        requestFactory.setReadTimeout(5000);
        requestFactory.setConnectionRequestTimeout(200);
        requestFactory.setBufferRequestBody(false);
        return requestFactory;
    }


    @Bean
    public RestTemplate solrRestTemplate(HttpComponentsClientHttpRequestFactory solrHttpFactory) {
        RestTemplate restTemplate = new RestTemplate(solrHttpFactory);
        return restTemplate;
    }
}
