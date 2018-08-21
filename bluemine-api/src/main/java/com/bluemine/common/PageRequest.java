package com.bluemine.common;

import java.io.Serializable;
import java.util.Arrays;

/**
 * @author hechao
 * @date 2017/4/17.
 */
public class PageRequest<T extends SortRequest> implements Serializable{

    private static final long serialVersionUID = 905321200119558891L;

    protected int page = 0;

    protected int size = 1;

    protected T[] sort;

    public PageRequest() {
        this(0, 1);
    }

    public PageRequest(int page, int size) {
        this.page = page;
        this.size = size;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public void setSort(T[] sort) {
        this.sort = sort;
    }

    public T[] getSort() {
        return sort;
    }

    @Override
    public String toString() {
        return "PageRequest{" +
                "page=" + page +
                ", size=" + size +
                ", sort=" + Arrays.toString(sort) +
                '}';
    }
}
