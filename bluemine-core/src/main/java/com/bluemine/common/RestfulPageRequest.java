package com.bluemine.common;

import org.springframework.data.domain.Sort;

/**
 * Created by hechao on 2018/8/21.
 */
public class RestfulPageRequest<D, S extends SortRequest>extends RestfulRequest<D> {

    protected PageRequest<S> paging;

    public void setPaging(PageRequest<S> paging) {
        this.paging = paging;
    }

    public Sort getSort() {
        SortRequest[] sort = paging.getSort();
        if(sort.length==0)
            return null;
        Sort.Order[] orders = new Sort.Order[sort.length];
        for (int i = 0, l = sort.length; i < l; i++) {
            orders[i] = new Sort.Order(Sort.Direction.valueOf(sort[i].getDirection()), sort[i].getProperty());
        }
        return new Sort(orders);
    }

    public org.springframework.data.domain.PageRequest getPageRequest() {
        return getPageRequest(0);
    }

    public org.springframework.data.domain.PageRequest getPageRequest(int diff) {
        return getPageRequest(paging.getPage() + diff, getSort());
    }

    public org.springframework.data.domain.PageRequest getPageRequest(int page, Sort sort) {
        return getPageRequest(page, paging.getSize(), sort);
    }

    public org.springframework.data.domain.PageRequest getPageRequest(int page, int size, Sort sort) {
        return new org.springframework.data.domain.PageRequest(page, size, sort);
    }

    @Override
    public String toString() {
        return "RestfulPageRequest{" +
                "paging=" + paging +
                "} " + super.toString();
    }
}
