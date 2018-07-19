package com.bluemine.common;

import com.bluemine.context.RequestContext;

import java.time.LocalDateTime;

/**
 * Created by hechao on 2017/8/29.
 */
public class RestfulRequest<T> {

    private RequestContext<T> context;

    protected GenericRestfulRequest generic;

    protected T data;

    protected RestfulPageRequest paging;

    public GenericRestfulRequest getGeneric() {
        return generic;
    }

    public void setGeneric(GenericRestfulRequest generic) {
        this.generic = generic;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public RestfulPageRequest getPaging() {
        return paging;
    }

    public void setPaging(RestfulPageRequest paging) {
        this.paging = paging;
    }

    public boolean isRevised(){
        String version = getContext().getParent().getVersion();
        if(version==null || generic==null || generic.getVersion()==null){
            return false;
        }
        return version.equals(generic.getVersion());
    }

    public synchronized RequestContext<T> getContext(){
        if(context == null){
            context = new RequestContext<T>(this);
        }
        return context;
    }

    public LocalDateTime getBusinessTime(){
        if(generic==null){
            return LocalDateTime.now();
        }
        return generic.getRequestTime();
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("RequestDTO{");
        sb.append("data=").append(data);
        sb.append(", generic=").append(generic);
        sb.append(", paging=").append(paging);
        sb.append("}");
        return sb.toString();
    }
}
