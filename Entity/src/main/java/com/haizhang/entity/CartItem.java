package com.haizhang.entity;

import java.io.Serializable;

/**
 * 存放购物车里面的信息
 *
 * @author 海章
 * @create 2018-11-17 20:38
 */
public class CartItem implements Serializable {
     private GoodsInfo goodsInfo;   //订单的货品信息
     private int sumOfGoods;        //订单货品的数量
     private double totalPrice;      //订单的货品总金额

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice*goodsInfo.getPrice();
    }

    public CartItem(){}

    public GoodsInfo getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(GoodsInfo goodsInfo) {
        this.goodsInfo = goodsInfo;
    }

    public int getSumOfGoods() {
        return sumOfGoods;
    }

    public void setSumOfGoods(int sumOfGoods) {
        this.sumOfGoods = sumOfGoods;
    }
}
