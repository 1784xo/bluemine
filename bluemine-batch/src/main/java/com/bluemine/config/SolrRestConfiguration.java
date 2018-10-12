package com.bluemine.config;

import org.apache.http.Header;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicHeader;
import org.springframework.boot.context.properties.ConfigurationProperties;
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
@ConfigurationProperties(prefix = "bluemine.solr", ignoreUnknownFields = false)
public class SolrRestConfiguration {

    private String tagCollectUrl;

    private int requestRetry;
    private int connectionMaxTotal;
    private int connectTimeout;
    private int readTimeout;
    private int connectionRequestTimeout;

    public SolrRestConfiguration() {
        requestRetry = 3;
        connectionMaxTotal = 200;
        connectTimeout = 5000;
        readTimeout = 5000;
        connectionRequestTimeout = 200;
    }

    public String getTagCollectUrl() {
        return tagCollectUrl;
    }

    public void setTagCollectUrl(String tagCollectUrl) {
//        this.tagCollectUrl = tagCollectUrl.replace("{keyword}", "{1}").replace("{expression}", "{2}");
        this.tagCollectUrl = tagCollectUrl;
    }

    public int getRequestRetry() {
        return requestRetry;
    }

    public void setRequestRetry(int requestRetry) {
        this.requestRetry = requestRetry;
    }

    public int getConnectionMaxTotal() {
        return connectionMaxTotal;
    }

    public void setConnectionMaxTotal(int connectionMaxTotal) {
        this.connectionMaxTotal = connectionMaxTotal;
    }

    public int getConnectTimeout() {
        return connectTimeout;
    }

    public void setConnectTimeout(int connectTimeout) {
        this.connectTimeout = connectTimeout;
    }

    public int getReadTimeout() {
        return readTimeout;
    }

    public void setReadTimeout(int readTimeout) {
        this.readTimeout = readTimeout;
    }

    public int getConnectionRequestTimeout() {
        return connectionRequestTimeout;
    }

    public void setConnectionRequestTimeout(int connectionRequestTimeout) {
        this.connectionRequestTimeout = connectionRequestTimeout;
    }

    @Bean
    public HttpComponentsClientHttpRequestFactory solrHttpFactory() {
        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(30, TimeUnit.SECONDS);
        connectionManager.setMaxTotal(getConnectionMaxTotal());
        connectionManager.setDefaultMaxPerRoute(getConnectionMaxTotal());

        List<Header> headers = new ArrayList<Header>();
        headers.add(new BasicHeader("User-Agent", "Java/8(Apache HttpClient 4.5)"));
        headers.add(new BasicHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"));
        headers.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headers.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headers.add(new BasicHeader("Connection", "keep-alive"));

        HttpClient httpClient = HttpClientBuilder.create()
                .setConnectionManager(connectionManager)
                .setDefaultHeaders(headers)
                .setRetryHandler(new DefaultHttpRequestRetryHandler(getRequestRetry(), true))
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .build();

        HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(httpClient);
        requestFactory.setConnectTimeout(getConnectTimeout());
        requestFactory.setReadTimeout(getReadTimeout());
        requestFactory.setConnectionRequestTimeout(getConnectionRequestTimeout());
        requestFactory.setBufferRequestBody(false);
        return requestFactory;
    }


    @Bean
    public RestTemplate solrRestTemplate(HttpComponentsClientHttpRequestFactory solrHttpFactory) {
        RestTemplate restTemplate = new RestTemplate(solrHttpFactory);
        return restTemplate;
    }
}
