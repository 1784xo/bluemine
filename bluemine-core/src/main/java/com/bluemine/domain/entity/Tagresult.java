package com.bluemine.domain.entity;

import com.bluemine.common.TagCollectResponse;

import java.util.List;

/**
 * Created by wangjt on 2018/9/7.
 */
public class Tagresult {
    private Integer total;
    private List<TagCollectResponse> rows;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<TagCollectResponse> getRows() {
        return rows;
    }

    public void setRows(List<TagCollectResponse> rows) {
        this.rows = rows;
    }
}
