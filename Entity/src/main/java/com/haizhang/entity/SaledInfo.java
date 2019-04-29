package com.haizhang.entity;

import java.io.Serializable;
import java.util.Date;

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
    //日期出售
    private Date saledDate;
    //货物具体信息
    private GoodsInfo goodsInfo;

    public SaledInfo(){

    }

    public Date getSaledDate() {
        return saledDate;
    }

    public void setSaledDate(Date saledDate) {
        this.saledDate = saledDate;
    }

    public GoodsInfo getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(GoodsInfo goodsInfo) {
        this.goodsInfo = goodsInfo;
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

    @Override
    public String toString() {
        return "SaledInfo{" +
                "goodsId=" + goodsId +
                ", merchantId=" + merchantId +
                ", saledNumber=" + saledNumber +
                ", saledDate=" + saledDate +
                ", goodsInfo=" + goodsInfo +
                '}';
    }
}
