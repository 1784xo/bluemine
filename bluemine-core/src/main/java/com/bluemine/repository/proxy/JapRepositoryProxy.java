package com.bluemine.repository.proxy;

import com.bluemine.context.ServerApplicationContext;
import com.bluemine.domain.entity.BaseEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.support.Repositories;

/**
 * Created by hechao on 2017/9/11.
 */
public class JapRepositoryProxy<T extends BaseEntity> extends RepositoryProxy<T> {

    private Repositories repositories;

    public JapRepositoryProxy(ServerApplicationContext context) {
        super(context);
        repositories = context.getRepositories();
    }

    @Override
    public void commit(T entity) {
        JpaRepository repository = getRepository(entity.getClass());
        repository.save(entity);
    }

    @Override
    protected Iterable commit(Class cls, Iterable entitys) {
        JpaRepository repository = getRepository(cls);
        return repository.save(entitys);
    }

    @Override
    public Object commitAndFlush(T entity) {
        JpaRepository repository = getRepository(entity.getClass());
        return repository.saveAndFlush(entity);
    }

    public JpaRepository getRepository(Class cls) {
        return (JpaRepository) repositories.getRepositoryFor(cls);
    }
}
