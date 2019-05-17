package com.bookShop.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.EXPECTATION_FAILED,reason = "货物信息不合法！请检查货物价格和库存！")
public class GoodsInfoInValidException extends RuntimeException {
    public GoodsInfoInValidException(String message) {
        super(message);
    }
}
