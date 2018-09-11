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

/**
 * Created by hechao on 2018/9/6.
 */
@Component
public class SolrHttpClient {

    @Inject
    private RestTemplate solrRestTemplate;

    @Inject
    private SolrRestConfiguration solrRestConfiguration;

    public SolrResponse getTagCollect(String sessionId, String expression) {
        ResponseEntity<SolrResponse> responseEntity = solrRestTemplate.getForEntity(solrRestConfiguration.getTagCollectUrl(), SolrResponse.class, sessionId, expression);
        AssertUtils.isTrue(responseEntity.getStatusCode() == HttpStatus.OK, ExceptionMessageEnum.HTTP_STATUS_EXCEPTION);
        return responseEntity.getBody();
    }

}
