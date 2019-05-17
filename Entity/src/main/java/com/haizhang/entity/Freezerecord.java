package com.haizhang.entity;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Future;
import java.util.*;


public class Freezerecord{
  //冻结编号
  private long id;
  //冻结起始日期
  private Date date;
  //原因
  @NotBlank(message = "请输入冻结原因")
  private String reason;
  //用户记录
  private UserInfo userInfo;
  //用户编号
  private int userId;
  //冻结终止日期
  @Future(message = "时间必须是未来的时间！")
  private Date endDate;

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  @Override
  public String toString() {
    return "Freezerecord{" +
            "id=" + id +
            ", date=" + date +
            ", reason='" + reason + '\'' +
            ", userInfo=" + userInfo +
            ", userId=" + userId +
            ", endDate=" + endDate +
            '}';
  }
}
