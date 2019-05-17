package com.haizhang.entity;


import java.util.Date;

public class Feedback {

  private int requestId;  //请求id
  private String reason;  //原因
  private Date checkDate; //检查日期
  private int id;    //审批的管理员id
  private int state; //0未通过，1通过
  private int userId; //用户的id

  public int getRequestId() {
    return requestId;
  }

  public void setRequestId(int requestId) {
    this.requestId = requestId;
  }

  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }

  public Date getCheckDate() {
    return checkDate;
  }

  public void setCheckDate(Date checkDate) {
    this.checkDate = checkDate;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  @Override
  public String toString() {
    return "Feedback{" +
            "requestId=" + requestId +
            ", reason='" + reason + '\'' +
            ", checkDate=" + checkDate +
            ", id=" + id +
            ", state=" + state +
            ", userId=" + userId +
            '}';
  }
}
