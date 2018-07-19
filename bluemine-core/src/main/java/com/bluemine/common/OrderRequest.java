package com.bluemine.common;

import org.springframework.data.domain.Sort;

/**
 * @author hechao
 * @date 2017/10/24.
 */
public class OrderRequest {
    private String property;
    private Sort.Direction direction;

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public Sort.Direction getDirection() {
        return direction;
    }

    public void setDirection(Sort.Direction direction) {
        this.direction = direction;
    }

    @Override
    public String toString() {
        return "OrderRequest{" +
                "direction=" + direction +
                ", property='" + property + '\'' +
                '}';
    }
}
