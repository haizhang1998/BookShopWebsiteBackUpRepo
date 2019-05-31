package com.haizhang.entity;

/**
 * 社交朋友
 */

public class Friend {

    //自己的id
    private  int userId;

    //朋友的信息
    private UserInfo friendInfo;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public UserInfo getFriendInfo() {
        return friendInfo;
    }

    public void setFriendInfo(UserInfo friendInfo) {
        this.friendInfo = friendInfo;
    }



    @Override
    public String toString() {
        return "Friend{" +
                "userId=" + userId +
                ", friendInfo=" + friendInfo +
                '}';
    }
}
