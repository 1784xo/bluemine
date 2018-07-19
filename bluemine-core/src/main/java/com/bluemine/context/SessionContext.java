package com.bluemine.context;

import com.bluemine.repository.proxy.JapRepositoryProxy;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.IdWorker;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 设备上下文
 * Created by hechao on 2017/10/17.
 */
public class SessionContext {

    private RepositoryProxy repository;

    private Map<Object, Object> attributes = new HashMap<>();

    public SessionContext(){

    }

    public IdWorker getIdWorker(){
        return getParent().getIdWorker();
    }
    /**
     * 得到父级设备上下文
     * @return
     * @see ServerApplicationContext
     */
    public ServerApplicationContext getParent() {
        return ApplicationContextLoader.getCurrentServerApplicationContext();
    }

    public void setAttribute(Object name, Object attr){
        attributes.put(name, attr);
    }

    public void romveAttribute(Object name){
        attributes.remove(name);
    }

    public Object getAttribute(Object name){
        return attributes.get(name);
    }

    public Set<Object> getAttributeNames(){
        return attributes.keySet();
    }

    /**
     * 得到数据仓库代理
     * @return
     */
    public synchronized RepositoryProxy getRepository(){
        if(repository == null){
            repository = new JapRepositoryProxy(getParent());
        }
        return repository;
    }
}
