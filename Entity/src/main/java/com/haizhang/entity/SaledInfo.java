package com.haizhang.entity;

import java.io.Serializable;

/**
 * 保存商品销售量的javabean
 *
 * @author 海章
 * @create 2018-11-14 10:14
 */
public class SaledInfo implements Serializable {
   //商品编号
    private int goodsId;
    //商家编号
    private int merchantId;
    //销售数量
    private int saledNumber;

    public SaledInfo(){

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

    public int getSaledNumber() {
        return saledNumber;
    }

    public void setSaledNumber(int saledNumber) {
        this.saledNumber = saledNumber;
    }
}
