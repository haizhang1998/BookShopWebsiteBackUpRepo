package com.haizhang.entity;

/**
 * requestshop申请店铺记录javabean
 */
public class Requsetshoprecord {
  private long userId;       //用户id
  private String shopName;   //申请的店铺名字
  private String detail;     //店铺描述信息
  private long requsetId;    //申请消息的排序号


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getShopName() {
    return shopName;
  }

  public void setShopName(String shopName) {
    this.shopName = shopName;
  }


  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }


  public long getRequsetId() {
    return requsetId;
  }

  public void setRequsetId(long requsetId) {
    this.requsetId = requsetId;
  }

}
