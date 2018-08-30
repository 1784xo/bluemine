package com.bluemine.domain.entity.support;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.time.LocalDate;

/**
 * Created by hechao on 2017/9/29.
 */
@Converter(autoApply = true)
public class LocalDateConverter implements AttributeConverter<LocalDate, Integer> {

    @Override
    public Integer convertToDatabaseColumn(LocalDate time) {
        return convert(time);
    }

    @Override
    public LocalDate convertToEntityAttribute(Integer date) {
        return convert(date);
    }

    public static Integer convert(LocalDate attribute) {
        return attribute == null ? null : (attribute.getYear() * 10000
                + attribute.getMonthValue() * 100
                + attribute.getDayOfMonth());
    }

    public static LocalDate convert(Integer date) {
        if (date == null) return null;
        int year = date / 10000;
        int rem = date % 10000;
        int month = rem / 100;
        int dayOfMonth = rem % 100;
        return LocalDate.of(year, month, dayOfMonth);
    }
}
