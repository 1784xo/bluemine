package com.bluemine.repository.proxy;

import com.bluemine.context.ServerApplicationContext;
import com.bluemine.domain.entity.BaseEntity;
import com.google.common.collect.Maps;
import com.google.common.collect.Table;
import com.google.common.collect.Tables;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Created by hechao on 2017/8/29.
 */
public abstract class RepositoryProxy<T extends BaseEntity>{

    private Table<Class<T>, Object, T> bigTable = Tables.newCustomTable(
            Maps.<Class<T>, Map<Object, T>>newHashMap(), Maps::newLinkedHashMap
    );

    public RepositoryProxy(ServerApplicationContext context) {

    }

    /**
     * 将实体实例加入到提交队列中，等待 commit 方法被调用。
     * @param entity
     */
    public void push(T entity){
        entity.markModified();
        bigTable.put((Class<T>) entity.getClass(), entity.primaryKey(), entity);
    }

    /**
     * 将实体实例加入到提交队列中，等待 commit 方法被调用。
     * @param collection
     */
    public void push(Collection<T> collection){
        for(T entity : collection){
            push(entity);
        }
    }

    /**
     * 将实体实例重
     * @param entity
     * @return
     */
    public T pull(T entity){
        return pull((Class<T>) entity.getClass(), entity.primaryKey());
    }

    public T pull(Class<T> rowKey, Object columnKey){
        return bigTable.remove(rowKey, columnKey);
    }

    public Map<Object, T> get(Class<T> cls){
        return bigTable.row(cls);
    }

    public T get(Class<T> rowKey, Object colKey){
        return bigTable.get(rowKey, colKey);
    }

    public abstract Object commitAndFlush(T entity);

    public abstract void commit(T entity);

    public void commit(Iterable<T> iterable){
        commit(iterable.iterator());
    }

    public void commit(Iterator<T> iterator) {
        while (iterator.hasNext()){
            commit(iterator.next());
        }
    }

    public abstract JpaRepository getRepository(Class cls);

    protected abstract Iterable<T> commit(Class<T> cls, Iterable<T> entitys);

    public void commit() {
        Set<Map.Entry<Class<T>, Map<Object, T>>> entrySet = bigTable.rowMap().entrySet();
        for(Map.Entry<Class<T>, Map<Object, T>> entry : entrySet){
            commit(entry.getKey(), entry.getValue().values());
        }
        bigTable.clear();
    }
}
