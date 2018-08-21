package com.bluemine.common;

import com.bluemine.struct.TagCollectSortEnum;

import java.io.Serializable;

/**
 * Created by hechao on 2018/8/21.
 */
public class TagCollectSort extends SortRequest implements Serializable{

    private static final long serialVersionUID = 2237055180671929319L;

    @Override
    public String getProperty() {
        return TagCollectSortEnum.valueOf(property).getValue();
    }
}
