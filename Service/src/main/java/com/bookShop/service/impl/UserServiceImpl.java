package com.bookShop.service.impl;

import com.bookShop.exception.QueryUserException;
import com.bookShop.exception.UserLoginValidatorException;
import com.bookShop.mapper.UserMapper;
import com.bookShop.service.UserService;
import com.haizhang.entity.UserInfo;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
    @Resource
   private UserMapper userMapper;

    @Override
    public String registUserInfo(UserInfo userInfo)throws Exception {
        return userMapper.registUserInfo(userInfo)>0?"注册成功！":"注册失败！";
    }

    @Override
    public UserInfo loginUser(String username, String password)throws Exception{
        UserInfo userInfo=userMapper.loginUser(username,password);
        System.out.println(userInfo);
        if(userInfo==null) throw new UserLoginValidatorException("登录验证失败！请输入正确用户名及密码！");
        return userInfo;
    }

    @Override
    public UserInfo queryUserInfo(UserInfo userInfo)throws Exception {
        UserInfo user=userMapper.queryUserInfo(userInfo);
        if(user==null)throw new QueryUserException("用户不存在，请检查信息是否正确！");
        return user;
    }

    @Override
    public List<UserInfo> queryAllUserInfo()throws Exception {
        List<UserInfo>userInfos=userMapper.queryAllUserInfo();
        return userInfos;
    }

    @Override
    public int freezeUser(Integer userId)throws Exception {
        return userMapper.freezeUser(userId);

    }

    @Override
    public int unfreezeUser(Integer userId)throws Exception {
        return userMapper.unfreezeUser(userId);
    }

    @Override
    public int deleteUser(Integer userId)throws Exception {
        return userMapper.deleteUser(userId);

    }

    @Override
    public int reigstMerchant(Integer userId)throws Exception {
        return userMapper.reigstMerchant(userId);
    }

    @Override
    public int reviseUserInfo(Integer userId, UserInfo userInfo)throws Exception {
        return userMapper.reviseUserInfo(userInfo);
    }
}
