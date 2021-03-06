package com.bluemine.context;

import com.bluemine.common.RestfulRequest;

/**
 * 交易性事务设备上下文。每次交易请求都会创建新的事务设备上下文。生命周期随着请求的线程结束而结束。
 * Created by hechao on 2017/8/31.
 *
 * @param <T> data class
 */
public class RequestContext<T> extends SessionContext {

}
