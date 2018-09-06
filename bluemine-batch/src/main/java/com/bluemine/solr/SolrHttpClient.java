package com.bluemine.solr;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.SolrResponse;
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

    public SolrResponse get(String sessionId, String expression) {
//        TODO:配置化
        ResponseEntity<SolrResponse> responseEntity = solrRestTemplate.getForEntity("http://140.143.19.85:8983/solr/blueminecore/select?q=SessionID:{1} AND {2}", SolrResponse.class, sessionId, expression);
        AssertUtils.isTrue(responseEntity.getStatusCode() == HttpStatus.OK, ExceptionMessageEnum.HTTP_STATUS_EXCEPTION);
        return responseEntity.getBody();
    }

}
