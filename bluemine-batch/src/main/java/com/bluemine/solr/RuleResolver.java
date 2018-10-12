package com.bluemine.solr;

import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by hechao on 2018/9/6.
 */
public abstract class RuleResolver {
    public static String resolve(String str) {
        return str.replaceAll("\\$", "Content:").replace("&", " AND ").replace("|", " OR ").replace("!", " NOT ");
    }


    public static void main(String[] args) {

        Calendar instance = Calendar.getInstance();
        instance.setTimeZone(TimeZone.getDefault());
        instance.setTime(new Date());
        instance.set(Calendar.HOUR_OF_DAY, 0);
        instance.set(Calendar.MINUTE, 0);
        instance.set(Calendar.SECOND, 0);
        instance.set(Calendar.MILLISECOND, 0);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");


        String format = instance.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'"));

//        System.out.println(dateFormat.format(instance.getTime()));
        System.out.println(format);



//        Instant instant = instance.toInstant();
//        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
//        System.out.println(DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(localDateTime));
//        System.out.println(LocalDate.now().format(DateTimeFormatter.ISO_INSTANT));
    }
}
