package com.bluemine.common;

/**
 * Created by hechao on 2018/9/11.
 */
public class HttpRestfulPageResponse<T> extends HttpRestfulResponse {
    private long total;

    private int totalPages;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
}
