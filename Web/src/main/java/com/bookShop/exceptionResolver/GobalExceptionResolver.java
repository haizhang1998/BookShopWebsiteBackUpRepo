package com.bookShop.exceptionResolver;


import com.bookShop.exception.UserLoginValidatorException;
import org.apache.log4j.*;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.*;

public class GobalExceptionResolver {
    private static final Logger log=Logger.getLogger(GobalExceptionResolver.class);
//    @Override
//    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
//        log.error("接受到异常!",ex);
//        //obj ：包名+类名+方法名（形参） 字符串，将这些字符串信息记录在日志文件中，方便以后查看。可以用log4j记录
//        //判断异常类型，是否为自定义异常
//        RuntimeException exception=null;
//
//        if(ex instanceof UserLoginValidatorException){
//            //登陆异常
//            exception=(UserLoginValidatorException)ex;
//            log.error("异常信息:"+exception.getMessage());
//        }else{
//            //未知异常
//            exception=new RuntimeException(ex.getMessage());
//            log.error("异常信息:"+exception.getMessage());
//        }
//          ModelAndView modelAndView=new ModelAndView();
//          modelAndView.setViewName("error");
//          modelAndView.addObject("state",exception.getMessage());
//          return modelAndView;
//    }

     @ExceptionHandler(UserLoginValidatorException.class)
     public String userExceptionHandler(Model model){
         model.addAttribute("state","用户登录异常");
         return "login";

     }


}
