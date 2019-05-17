package com.haizhang.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * requestshop申请店铺记录javabean
 */
public class RequestRecordShop {
  private int userId;       //用户id
  @NotBlank(message = "申请店铺名必须大于0")
  private String shopName;   //申请的店铺名字
  @Size(min=5,max=100,message="请输入店铺描述信息,保持在{min}和{max}之间")
  private String detail;     //店铺描述信息
  private String addr;       //发货地址
  private int requestId;    //申请消息的排序号
  private String shopLogo;   //商店图标
  private int requestState;   //0代表未处理，1代表未通过，2代表通过
  private Date requestDate;     //请求日期

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
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

  public int getRequestId() {
    return requestId;
  }

  public void setRequestId(int requestId) {
    this.requestId = requestId;
  }

  public String getShopLogo() {
    return shopLogo;
  }

  public void setShopLogo(String shopLogo) {
    this.shopLogo = shopLogo;
  }

  public int getRequestState() {
    return requestState;
  }

  public void setRequestState(int requestState) {
    this.requestState = requestState;
  }

  public Date getRequestDate() {
    return requestDate;
  }

  public void setRequestDate(Date requestDate) {
    this.requestDate = requestDate;
  }

  public String getAddr() {
    return addr;
  }

  public void setAddr(String addr) {
    this.addr = addr;
  }

  @Override
  public String toString() {
    return "RequestRecordShop{" +
            "userId=" + userId +
            ", shopName='" + shopName + '\'' +
            ", detail='" + detail + '\'' +
            ", addr='" + addr + '\'' +
            ", requestId=" + requestId +
            ", shopLogo='" + shopLogo + '\'' +
            ", requestState=" + requestState +
            ", requestDate=" + requestDate +
            '}';
  }
}
