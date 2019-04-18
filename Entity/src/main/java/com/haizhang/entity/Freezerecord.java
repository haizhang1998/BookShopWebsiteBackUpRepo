package com.haizhang.entity;
import java.util.*;


public class Freezerecord {

  private long id;
  private Date date;
  private String reason;
  private long userId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public Date getDate() {
    return date;
  }

  public void setDate(java.sql.Date date) {
    this.date = date;
  }


  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

}
