package com.bluemine;

/**
 * Created by hechao on 2018/2/6.
 */
public class LogicException extends ServerRuntimeException {

    public LogicException() {
        super(ExceptionMessageEnum.LOGIC_EXCEPTION.ERROR_CODE);
    }

    public LogicException(String message) {
        super(ExceptionMessageEnum.LOGIC_EXCEPTION.ERROR_CODE, message);
    }
}
