package com.bluemine.test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hechao on 2018/7/11.
 */
public abstract class TestCollider {
    /**
     *
     * @param channelNo 商家号
     * @param callNo 会话号
     * @param callType 会话类型
     * @param roleType 角色类型
     * @param exps 规则表达式
     * @return
     */
    public static List<String> collide(String channelNo, String callNo, String callType, String roleType, String exps){
        int i = (int) (Math.random() * 100);
        ArrayList<String> list = new ArrayList<>();
        for(int j = 0; j<i; j++){
            list.add(j+" msg");
        }
        return list;
    }
}
