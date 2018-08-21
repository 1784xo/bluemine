package com.bluemine.common;

import java.io.Serializable;

/**
 * @author hechao
 * @date 2017/10/24.
 */
public class SortRequest implements Serializable{

    private static final long serialVersionUID = 8499103762139718491L;

    protected String property;

    protected String direction;

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    @Override
    public String toString() {
        return "SortRequest{" +
                "direction=" + direction +
                ", property='" + property + '\'' +
                '}';
    }
}
