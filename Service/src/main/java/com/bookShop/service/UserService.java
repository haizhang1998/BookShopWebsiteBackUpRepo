package com.bookShop.service;

import com.haizhang.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    //注册
    public String registUserInfo(UserInfo userInfo)throws Exception;
    //登录
    public UserInfo loginUser( String username, String password)throws Exception;
    //查询指定用户
    public  UserInfo queryUserInfo(UserInfo userInfo)throws Exception;
    //查询全部用户
    public List<UserInfo> queryAllUserInfo()throws Exception;
    //冻结用户
    public int freezeUser(Integer userId)throws Exception;
    //解冻用户
    public int unfreezeUser(Integer userId)throws Exception;
    //删除用户
    public int deleteUser(Integer userId)throws Exception;
    //申请开店
    public int reigstMerchant(Integer userId)throws Exception;
    //修改账号信息
    public int reviseUserInfo(Integer userId,UserInfo userInfo)throws Exception;

    //实现分页查询
    public List<UserInfo> queryUserByPage(@Param("limit")int limit,@Param("offset")int offset);

    //计算用户数
    public int countUserNum();
}
