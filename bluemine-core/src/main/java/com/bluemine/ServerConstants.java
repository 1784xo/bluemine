package com.bluemine;

import java.time.format.DateTimeFormatter;

/**
 * Created by hechao on 2017/7/21.
 */
public abstract class ServerConstants {
    public static final String CONFIG_FILE ="config.file";
    public static final String PROFILE_SERVER_ID ="server.id";
    public static final String PROFILE_CLUSTER_ID ="server.cluster";
    public static final String PROFILE_SERVER_VERSION ="server.version";
    public static final String PROFILES ="spring.profiles.active";

    public static final int ROOT_TAG_ID =  0;


    public static final DateTimeFormatter YYYY_MM_DD_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
}
