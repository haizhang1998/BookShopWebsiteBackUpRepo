package com.bookShop.controller;

import com.bookShop.service.UserService;
import com.bookShop.utils.CommonUtil;
import com.haizhang.entity.UserInfo;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sys")
public class ManagerHandler {
    @Resource
    UserService userServiceImpl;
    CommonUtil commonUtil = CommonUtil.getInstance();


//    /**
//     * 获取管理员界面
//     * @return

    @RequestMapping(value = "/form",method = RequestMethod.GET)
    public String getManagerForm(){
        return "managerPage";
    }

    /**
     * 查询所有的用户
     * @return
     */
    @RequestMapping(value = "/queryAlUser" ,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String,Object> queryAllUser(int limit,int offset) throws Exception {
            System.err.println(limit+":offset,"+offset);
            List<UserInfo> userInfos=userServiceImpl.queryUserByPage(limit+offset,offset+1);
            return commonUtil.packageDataIntoMap(userServiceImpl.countUserNum(),userInfos);

    }

}
