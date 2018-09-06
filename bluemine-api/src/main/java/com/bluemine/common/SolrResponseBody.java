package com.bluemine.common;

/**
 * Created by hechao on 2018/9/6.
 */
public class SolrResponseBody {
    private Integer numFound;
    private Integer start;
    private SolrResponseData[]  docs;

    public Integer getNumFound() {
        return numFound;
    }

    public void setNumFound(Integer numFound) {
        this.numFound = numFound;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public SolrResponseData[] getDocs() {
        return docs;
    }

    public void setDocs(SolrResponseData[] docs) {
        this.docs = docs;
    }
}
