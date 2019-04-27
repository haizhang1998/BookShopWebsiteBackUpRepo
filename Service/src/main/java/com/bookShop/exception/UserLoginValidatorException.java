package com.bookShop.exception;

import com.google.protobuf.ServiceException;

/**
 *  `
 */
public class UserLoginValidatorException extends RuntimeException{
    public UserLoginValidatorException(String message) {
        super(message);
    }
}
