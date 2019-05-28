package com.haizhang.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 聊天消息的JavaBean
 */
public class Message {
    //传递的内容
    private String text;
    //写消息的用户
    private int from;
    //收消息的用户
    private int to;
    //传递消息的日期
    private Date date;
    //写消息的人的名称
    private String fromName;
    //信息类型 1代表上线信息，-1代表下线，0是正常信息 2是初始化消息 3是添加用户的信息,4代表要求对方更新列表
    private int msgType;
    //当前在线的用户列表
    private List<UserInfo> userOnlineList;
    //当前用户的离线列表
    private List<UserInfo> userDisOnlineList;
    //设置消息传递的用户头像
    private String transportImageLogo;

    public String getTransportImageLogo() {
        return transportImageLogo;
    }

    public void setTransportImageLogo(String transportImageLogo) {
        this.transportImageLogo = transportImageLogo;
    }

    public List<UserInfo> getUserOnlineList() {
        return userOnlineList;
    }

    public void setUserOnlineList(List<UserInfo> userOnlineList) {
        this.userOnlineList = userOnlineList;
    }

    public List<UserInfo> getUserDisOnlineList() {
        return userDisOnlineList;
    }

    public void setUserDisOnlineList(List<UserInfo> userDisOnlineList) {
        this.userDisOnlineList = userDisOnlineList;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getFrom() {
        return from;
    }

    public void setFrom(int from) {
        this.from = from;
    }

    public int getTo() {
        return to;
    }

    public void setTo(int to) {
        this.to = to;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public int getMsgType() {
        return msgType;
    }

    public void setMsgType(int msgType) {
        this.msgType = msgType;
    }

    @Override
    public String toString() {
        return "Message{" +
                "text='" + text + '\'' +
                ", from=" + from +
                ", to=" + to +
                ", date=" + date +
                ", fromName='" + fromName + '\'' +
                ", msgType=" + msgType +
                ", userOnlineList=" + userOnlineList +
                ", userDisOnlineList=" + userDisOnlineList +
                '}';
    }
}