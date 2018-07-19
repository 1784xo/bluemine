package com.bluemine.util;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.ServerRuntimeException;
import com.bluemine.context.ApplicationContextLoader;
import com.bluemine.context.ServerApplicationContext;
import org.slf4j.helpers.MessageFormatter;

/**
 * Created by hechao on 2017/9/1.
 */
public abstract class AssertUtils {

    private static Object[] EMPTY_MESSAGE_ARGS = new Object[0];

    private static ServerApplicationContext getContext() {
        return ApplicationContextLoader.getCurrentServerApplicationContext();
    }

    public static String getMessage(boolean isCode, String msg, Object... args) {
        if (isCode) {
            return getContext().getMessage(msg, args);
        }
        return MessageFormatter.format(msg, args).getMessage();
    }

    public static void notNull(Object object, ExceptionMessageEnum message) {
        notNull(object, message, null);
    }

    public static void notNull(Object object, ExceptionMessageEnum message, Object... args) {
        notTrue(object == null, message, args);
    }

    public static void isTrue(boolean v, ExceptionMessageEnum message) {
        isTrue(v, message, null);
    }

    public static void isTrue(boolean v, ExceptionMessageEnum message, Object... args) {
        notTrue(!v, message, args);
    }

    public static void notTrue(boolean v, ExceptionMessageEnum message) {
        notTrue(v, message, null);
    }

    public static void notTrue(boolean v, ExceptionMessageEnum message, Object... args) {
        if (v == true) {
            throw new ServerRuntimeException(message.ERROR_CODE, getMessage(true, message.MESSAGE_CODE, args));
        }
    }

    public static void isNull(Object object, ExceptionMessageEnum message) {
        if (object != null) {
            throw new ServerRuntimeException(message.ERROR_CODE, getMessage(true, message.MESSAGE_CODE));
        }
    }
}