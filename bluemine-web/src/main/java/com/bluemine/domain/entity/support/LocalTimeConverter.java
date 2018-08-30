package com.bluemine.domain.entity.support;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.time.LocalTime;

/**
 * Created by hechao on 2017/9/29.
 */
@Converter(autoApply = true)
public class LocalTimeConverter implements AttributeConverter<LocalTime, Integer> {
    @Override
    public Integer convertToDatabaseColumn(LocalTime time) {
        return convert(time);
    }

    @Override
    public LocalTime convertToEntityAttribute(Integer time) {
        return convert(time);
    }

    public static LocalTime convert(Integer time) {
        if (time == null)
            return null;
        int hour = time / 10000;
        int rem = time % 10000;
        int minute = rem / 100;
        int second = rem % 100;
        return LocalTime.of(hour, minute, second);
    }

    public static Integer convert(LocalTime time) {
        return time == null ? null : (time.getHour() * 10000
                + time.getMinute() * 100
                + time.getSecond());
    }
}
