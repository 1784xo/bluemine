package com.bluemine.batch.test;

import org.springframework.beans.factory.annotation.Value;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hechao on 2018/7/11.
 */
public abstract class TestCollider {
    public static List<String> collide(String channelNo, String callNo, String callType, String roleType, String exps){
        int i = (int) (Math.random() * 100);
        ArrayList<String> list = new ArrayList<>();
        for(int j = 0; j<i; j++){
            list.add(j+" msg");
        }
        return list;
    }
}
