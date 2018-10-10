package com.bluemine.common;

import com.bluemine.context.RequestContext;

import java.time.LocalDateTime;

/**
 *
 * @param <T> data class
 */
public class RestfulRequest<T> {

    private RequestContext<T> context;

    protected RestfulGenericRequest generic = new RestfulGenericRequest();

    protected T data;

    public RestfulGenericRequest getGeneric() {
        return generic;
    }

    public void setGeneric(RestfulGenericRequest generic) {
        this.generic = generic;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
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
            context = new RequestContext<T>();
        }
        return context;
    }

    public LocalDateTime getBusinessTime(){
        if(generic==null){
            return LocalDateTime.now();
        }
        return generic.getRequestTime();
    }

//    public <E extends Class> RestfulPageRequest<T> toPageRequest(E cls){
//        if(RestfulPageRequest.class.isInstance(this)){
//            return (RestfulPageRequest<T>) this;
//        }
//        throw new ClassCastException();
//    }

    @Override
    public String toString() {
        return "RestfulRequest{" +
                "businessTime=" + getBusinessTime() +
                ", context=" + context +
                ", data=" + data +
                ", generic=" + generic +
                '}';
    }
}
