package com.bluemine.solr;

/**
 * Created by hechao on 2018/9/6.
 */
public abstract class RuleResolver {
    public static String resolve(String str) {
        return str.replaceAll("\\$", "Content:").replace("&", " AND ").replace("|", " OR ").replace("!", " NOT ");
    }
}
