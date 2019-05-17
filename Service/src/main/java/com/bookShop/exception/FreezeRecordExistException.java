package com.bookShop.exception;

public class FreezeRecordExistException extends RuntimeException{
    public FreezeRecordExistException(String message) {
        super(message);
    }
}
