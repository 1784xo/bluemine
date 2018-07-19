package com.bluemine;

/**
 * Created by hechao on 2018/4/4.
 */
public class DuplicateException extends ServerRuntimeException {

    public DuplicateException() {
        super(ExceptionMessageEnum.DB_DUPLICATE_EXCEPTION.ERROR_CODE);
    }

    public DuplicateException(String message) {
        super(ExceptionMessageEnum.DB_DUPLICATE_EXCEPTION.ERROR_CODE, message);
    }
}