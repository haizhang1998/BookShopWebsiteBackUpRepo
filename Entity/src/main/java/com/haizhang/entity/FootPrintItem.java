package com.haizhang.entity;

import java.io.Serializable;

/**
 * 我的足迹项
 *
 * @author 海章
 * @create 2018-12-16 10:18
 */
public class FootPrintItem implements Serializable {
    private int goodsId;
    private int id;
    private String time;

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
