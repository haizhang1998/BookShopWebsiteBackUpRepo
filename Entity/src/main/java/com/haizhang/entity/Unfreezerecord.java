package com.haizhang.entity;

import java.util.Date;

/**
 * 解冻记录javabean
 */
public class Unfreezerecord {

  private long id;
  private long userId;
  private String reason;
  private Date time;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }


  public Date getTime() {
    return time;
  }

  public void setTime(java.sql.Date time) {
    this.time = time;
  }

}
