package com.bluemine;

/**
 * Created by hechao on 2017/9/1.
 */
public enum ExceptionMessageEnum {
    SYSINTR_EXCEPTION(50000001),
    UNKNOWN_EXCEPTION(50000002),
    PROFILE_EXCEPTION(50000003),

    LOGIC_EXCEPTION(50000050),
    NULL_EXCEPTION(50000100),

    ILLEGAL_ARGUMENT(50000301),
    ILLEGAL_REQUEST_ARGUMENT(50000401),

    DB_NO_SUCH_RESULT(50000501),
    DB_DUPLICATE_EXCEPTION(50000502);

    public final int ERROR_CODE;
    public final String MESSAGE_CODE;

    ExceptionMessageEnum(int code) {
        this.ERROR_CODE =code;
        this.MESSAGE_CODE =this.name();
    }
}
