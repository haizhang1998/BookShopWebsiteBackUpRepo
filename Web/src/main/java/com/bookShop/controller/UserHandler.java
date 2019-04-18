package com.bookShop.controller;

import com.bookShop.service.UserService;
import com.haizhang.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
/**
 * 处理用户操作信息
 */

@Controller
@RequestMapping("/user")
public class UserHandler {

    @Resource
    UserService userServiceImpl;

    @RequestMapping("/login")
    public void loginUser(HttpServletRequest request, HttpServletResponse response, @Valid UserInfo userInfo, Errors errors)throws Exception{
        if(errors.hasErrors()){
            request.setAttribute("userInfo",new UserInfo());
            request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
        }


        UserInfo user=userServiceImpl.loginUser(userInfo.getUsername(),userInfo.getPassword());
        HttpSession session=request.getSession();


        session.setAttribute("user",user);
        request.getRequestDispatcher("/jsp/success.jsp").forward(request,response);

    }

    @RequestMapping("/queryAllUser")
    public ModelAndView queryAllUser()throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<UserInfo>userInfos= userServiceImpl.queryAllUserInfo();
        modelAndView.setViewName("queryUser");
        modelAndView.addObject("userInfoLists",userInfos);
        return  modelAndView;
    }

    @RequestMapping("/regist")
    public ModelAndView queryAllUser(UserInfo userInfo)throws Exception{
        String res=userServiceImpl.registUserInfo(userInfo);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("regist");
        modelAndView.addObject("state",res);
        return  modelAndView;
    }


}
