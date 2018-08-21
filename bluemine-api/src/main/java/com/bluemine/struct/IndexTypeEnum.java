package com.bluemine.struct;

/**
 * Created by hechao on 2018/8/13.
 */
public enum IndexTypeEnum {
    FREQ("FREQUENCY"), //frequency
    CALL("CALL_NO"); //call

    private final String value;
    IndexTypeEnum(String val){
        value = val;
    }

    public String getValue() {
        return value;
    }
}
