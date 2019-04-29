package com.bookShop.controller;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.bookShop.service.UserService;
import com.haizhang.ValidateGroup.LoginGroup;
import com.haizhang.ValidateGroup.RegistGroup;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.jws.WebParam;
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

    public UserHandler() {
    }
    public UserHandler(UserService userService) {
        this.userServiceImpl=userService;
    }


    /**
     * 用户登录
     * @param request
     * @param response
     * @param userInfo 用户信息
     * @throws Exception
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public void loginUser(HttpServletRequest request, HttpServletResponse response,UserInfo userInfo)throws Exception{
        UserInfo user=userServiceImpl.loginUser(userInfo.getUsername(),userInfo.getPassword());
        HttpSession session=request.getSession();
        session.setAttribute("userInfo",user);
        response.sendRedirect("/goods/homepage");
    }

    /**
     *  返回用户请求窗体
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginForm(Model model) {
        model.addAttribute(new UserInfo());
        model.addAttribute("autoLogin","autoLogin");
        return "login";
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryAllUser")
    public ModelAndView queryAllUser()throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<UserInfo>userInfos= userServiceImpl.queryAllUserInfo();
        modelAndView.setViewName("queryUser");
        modelAndView.addObject("userInfoLists",userInfos);
        return  modelAndView;
    }



    @RequestMapping(value = "/regist",method = RequestMethod.GET)
    public String registUserForm(Model model)throws Exception{
        model.addAttribute(new UserInfo());
        return "regist";
    }

    @RequestMapping(value = "/regist",method = RequestMethod.POST)
    public String registUser(@Validated(RegistGroup.class) UserInfo userInfo, BindingResult bindingResult, Model model)throws Exception{
        if(bindingResult.hasErrors()){
            System.err.println("bingRes error");
            return "regist";

        }
        String res=userServiceImpl.registUserInfo(userInfo);
        model.addAttribute("reg_state",res);
        System.err.println(res);
        return "login";
    }






}
