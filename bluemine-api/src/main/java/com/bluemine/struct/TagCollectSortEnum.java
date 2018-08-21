package com.bluemine.struct;

/**
 * Created by hechao on 2018/8/13.
 */
public enum TagCollectSortEnum {
    FREQ("TOTAL_FREQUENCY"), //frequency
    CALL("CALL_NUM"); //call

    private final String value;

    TagCollectSortEnum(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
