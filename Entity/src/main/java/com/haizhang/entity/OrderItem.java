package com.haizhang.entity;

/**
 * @author 海章
 * @create 2018-12-16 21:02
 */
public class OrderItem {
private int goodsId;
private int id;          //用户id
private int merchantId;
private int sumOfGoods;
private String name;    //买家名字
private String addr;    //买家收货地址
private String phone;   //买家联系方式
private double totalMoney;//总价
private int payFlag=1;  //1代表未付款   0付款
private int backFlag=1; //1代表不退货  0退货
private  int sendFlag=1; //1代表未发货 0发货

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

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
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
}
