package com.bookShop.controller;

import com.bookShop.service.ChatService;
import com.bookShop.service.UserService;
import com.haizhang.entity.TempMsg;
import com.haizhang.entity.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller("chatHandler")
@RequestMapping("/chat")
public class ChatHandler {
    @Resource
    ChatService chatService;
    @Resource
    UserService userService;

    @RequestMapping("/chatPage")
    public String getChatPage(){
        return "chatting";
    }

    /**
     * 存放缓存信息或离线信息
     * @return
     */
    @RequestMapping(value="/saveTempMsg",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String saveMsgAsTemp(TempMsg tempMsg){
        System.err.println("saveMsgAsTemp:"+tempMsg);
        int flag=chatService.addTempMsg(tempMsg);
        String msg=flag>0?"{\"msg\":\"保存成功！\"}":"{\"msg\":\"保存失败！\"}";
        return msg;
    }

    /**
     * 清空指定的消息
     * @param tempMsg
     * @return
     */
    @RequestMapping(value="/delTempMsg",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String delMsg(TempMsg tempMsg){
        System.err.println("delMsg");
        boolean flag=chatService.clearTempMsg(tempMsg.getUserId(),tempMsg.getFriendId());
        String msg=flag?"{\"msg\":\"删除成功！\"}":"{\"msg\":\"删除失败！\"}";
        return msg;
    }

    /**
     * 根据ID添加好友
     * @param userId
     * @return
     */
    @RequestMapping(value="/addFriend",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addFriend(@RequestParam(value = "userId") int userId, @RequestParam("friendId") int friendId){
        System.err.println("addFriend");
        String msg=chatService.addFriend(userId,friendId);
        return "{\"msg\":\""+msg+"\"}";
    }

    /**
     * 根据Id删除好友
     * @param userId
     * @return
     */
    @RequestMapping(value="/delFriend",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String delFriend(@RequestParam(value = "userId") int userId, @RequestParam("friendId") int friendId){
        System.err.println("addFriend");
        String msg=chatService.deleteFriend(userId,friendId);
        return "{\"msg\":\""+msg+"\"}";
    }

    /**
     * 查询好友
     */
    @RequestMapping(value="/queryFriend",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<UserInfo> queryFriend(UserInfo userInfo) throws Exception {
         //根据昵称，用户账号，id查询用户
        List<UserInfo> userInfos=userService.queryUserInfo(userInfo);
        return userInfos;
    }

}
