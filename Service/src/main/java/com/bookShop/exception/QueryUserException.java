package com.bookShop.exception;

public class QueryUserException extends ServiceException {
    private String userLoginVertifyCode;

    public  QueryUserException(String msg) {
        super(msg);
    }

    public  QueryUserException(String code, String msg, String userLoginVertifyCode) {
        super(code, msg);
        this.userLoginVertifyCode = userLoginVertifyCode;
    }

    public  QueryUserException(String code, String msg, String logMsg, String userLoginVertifyCode) {
        super(code, msg, logMsg);
        this.userLoginVertifyCode = userLoginVertifyCode;
    }

    public String getUserLoginVertifyCode() {
        return userLoginVertifyCode;
    }

    public void setUserLoginVertifyCode(String userLoginVertifyCode) {
        this.userLoginVertifyCode = userLoginVertifyCode;
    }


}
