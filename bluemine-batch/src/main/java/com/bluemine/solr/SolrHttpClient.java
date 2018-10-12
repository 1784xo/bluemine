package com.bluemine.solr;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.SolrResponse;
import com.bluemine.config.SolrRestConfiguration;
import com.bluemine.util.AssertUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hechao on 2018/9/6.
 */
@Component
public class SolrHttpClient {

    @Inject
    private RestTemplate solrRestTemplate;

    @Inject
    private SolrRestConfiguration solrRestConfiguration;

    public SolrResponse getTagCollect(String keyword, String expression) {

        Map<String, String> params = new HashMap(){{
            put("keyword", keyword);
            put("expression", expression);
        }};

        ResponseEntity<SolrResponse> responseEntity = solrRestTemplate.getForEntity(solrRestConfiguration.getTagCollectUrl(), SolrResponse.class, params);
        AssertUtils.isTrue(responseEntity.getStatusCode() == HttpStatus.OK, ExceptionMessageEnum.HTTP_STATUS_EXCEPTION);
        return responseEntity.getBody();
    }



}
