package com.bookShop.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND,reason = "货物未找到")
public class GoodsNotFoundException extends RuntimeException{
    public GoodsNotFoundException(String message) {
        super(message);
    }
}
