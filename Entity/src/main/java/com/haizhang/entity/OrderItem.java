package com.haizhang.entity;

import java.sql.*;

public class OrderItem {
    private int orderId;     //订单号
    private int goodsId;     //商品编号
    private int id;          //用户id
    private int merchantId;
    private int sumOfGoods;
    private String name;    //买家名字
    private String addr;    //买家收货地址
    private String phone;   //买家联系方式
    private Date createTime;//订单创建时间
    private int payFlag=0;  //0代表未付款   1付款
    private int backFlag=0; //0代表不退货  1退货  2同意退款 3拒绝退款
    private int sendFlag=0; //0代表未发货 1发货 2收货
    private int orderFlag=0; //正在交易 1完成交易

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSendFlag() {
        return sendFlag;
    }

    public void setSendFlag(int sendFlag) {
        this.sendFlag = sendFlag;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public int getSumOfGoods() {
        return sumOfGoods;
    }

    public void setSumOfGoods(int sumOfGoods) {
        this.sumOfGoods = sumOfGoods;
    }

    public int getPayFlag() {
        return payFlag;
    }

    public void setPayFlag(int payFlag) {
        this.payFlag = payFlag;
    }

    public int getBackFlag() {
        return backFlag;
    }

    public void setBackFlag(int backFlag) {
        this.backFlag = backFlag;
    }

    public int getOrderFlag() {
        return orderFlag;
    }

    public void setOrderFlag(int orderFlag) {
        this.orderFlag = orderFlag;
    }
}
