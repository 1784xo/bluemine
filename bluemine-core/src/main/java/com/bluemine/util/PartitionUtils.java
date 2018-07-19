package com.bluemine.util;

/**
 * Created by hechao on 2018/2/9.
 */
public abstract class PartitionUtils {
    public static int nextInt(){
        int s = (int)(System.currentTimeMillis()%100000);
        return Math.max(s-(s%1000), 10000);
    }

    public static void main(String[] args){
        int next = PartitionUtils.nextInt();
        System.out.println(next);
    }
}