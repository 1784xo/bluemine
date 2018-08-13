package com.bluemine.domain.entity.support;

import javax.persistence.AttributeConverter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * Created by hechao on 2018/7/19.
 */
public class LocalDateTimeConverter implements AttributeConverter<LocalDateTime, Long> {
    @Override
    public Long convertToDatabaseColumn(LocalDateTime dateTime) {
        Long date = LocalDateConverter.convert(dateTime.toLocalDate()).longValue();
        date = date * 1000000;
        date += LocalTimeConverter.convert(dateTime.toLocalTime());
        return date;
    }

    @Override
    public LocalDateTime convertToEntityAttribute(Long dateTime) {

        long date = dateTime / 1000000;
        long time = dateTime - date * 1000000;

        LocalDate localDate = LocalDateConverter.convert((int) date);
        LocalTime localTime = LocalTimeConverter.convert((int) time);

        return localDate.atTime(localTime);
    }
}
