package com.bookShop.exception;

/**
 *  `
 */
public class UserLoginValidatorException  extends ServiceException{
    private String userLoginVertifyCode;

    public UserLoginValidatorException(String msg) {
        super(msg);
    }

    public UserLoginValidatorException(String code, String msg, String userLoginVertifyCode) {
        super(code, msg);
        this.userLoginVertifyCode = userLoginVertifyCode;
    }

    public UserLoginValidatorException(String code, String msg, String logMsg, String userLoginVertifyCode) {
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
