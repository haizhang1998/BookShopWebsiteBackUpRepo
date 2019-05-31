package com.haizhang.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 我的足迹项
 *
 * @author 海章
 * @create 2018-12-16 10:18
 */
public class FootPrintItem implements Serializable {
    private int goodsId;
    private int id;
    private Date time;
    private String imgDir;
    private String goodsName;

    public String getImgDir() {
        return imgDir;
    }

    public void setImgDir(String imgDir) {
        this.imgDir = imgDir;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

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


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "FootPrintItem{" +
                "goodsId=" + goodsId +
                ", id=" + id +
                ", time='" + time + '\'' +
                ", imgDir='" + imgDir + '\'' +
                ", goodsName='" + goodsName + '\'' +
                '}';
    }
}
