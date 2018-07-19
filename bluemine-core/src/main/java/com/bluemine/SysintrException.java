package com.bluemine;

/**
 * Created by hechao on 2017/10/16.
 */
public class SysintrException extends ServerRuntimeException{

    public SysintrException() {
        super(ExceptionMessageEnum.SYSINTR_EXCEPTION.ERROR_CODE);
    }

    public SysintrException(String message) {
        super(ExceptionMessageEnum.SYSINTR_EXCEPTION.ERROR_CODE, message);
    }
}
