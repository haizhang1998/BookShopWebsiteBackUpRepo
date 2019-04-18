package com.bookShop.exception;

/**
 * 定义一个业务异常，以后所有的业务异常均继承此异常类
 */
public class ServiceException extends RuntimeException {
    private static final long serialVersionUID=-4742838722274465L;
    //系统提示码
    private String code;
    //错误描述
    private String msg;
    //外部错误码
    private String logMsg;



    public ServiceException( String code, String msg) {

        this.code = code;
        this.msg = msg;
    }

    public ServiceException( String code, String msg,String logMsg) {
        this.logMsg=logMsg;
        this.code = code;
        this.msg = msg;
    }
    public ServiceException(String msg) {
        this.msg = msg;
    }
    public ServiceException() {
        super();
        this.msg = msg;
    }
    public ServiceException(Throwable t) {
        super(t);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String getMessage() {
        return super.getMessage();
    }

    @Override
    public String toString() {
        return "ServiceException{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", logMsg='" + logMsg + '\'' +
                '}';
    }
}
