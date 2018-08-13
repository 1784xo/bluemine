package com.bluemine.item;

import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;

/**
 * Created by hechao on 2018/7/4.
 */
public class SimpleItemReader<T> implements ItemReader<T>{

    private volatile T data;

    public SimpleItemReader(T data) {
        this.data = data;
    }

    @Override
    public T read() throws Exception, UnexpectedInputException, ParseException, NonTransientResourceException {
        T d = data;
        data = null;
        return d;
    }
}
