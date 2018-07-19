package com.bluemine.common;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import java.util.Arrays;

/**
 * @author hechao
 * @date 2017/4/17.
 */
public class RestfulPageRequest {

    protected int pageNumber = 0;

    protected int pageSize = 1;

    protected OrderRequest[] sort;

    public RestfulPageRequest() {
        this(0, 1);
    }

    public RestfulPageRequest(int page, int size) {
        pageNumber = page;
        pageSize = size;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setSort(OrderRequest[] sort) {
        this.sort = sort;
    }

    public Sort getSort() {
        if (sort == null) {
            return null;
        }
        Sort.Order[] orders = new Sort.Order[sort.length];
        for (int i = 0, l = sort.length; i < l; i++) {
            orders[i] = new Sort.Order(sort[i].getDirection(), sort[i].getProperty());
        }
        return new Sort(orders);
    }

    public PageRequest toPageRequest() {
        return toPageRequest(0);
    }

    public PageRequest toPageRequest(int diff) {
        return toPageRequest(pageNumber + diff, getSort());
    }

    public PageRequest toPageRequest(int page, Sort sort) {
        return toPageRequest(page, pageSize, sort);
    }

    public PageRequest toPageRequest(int page, int size, Sort sort) {
        return new PageRequest(page, size, sort);
    }

    @Override
    public String toString() {
        return "PageableRequest{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", sort=" + Arrays.toString(sort) +
                '}';
    }
}
