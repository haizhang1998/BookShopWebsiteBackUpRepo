package com.haizhang.entity;

/**
 * 收藏项
 *
 * @author 海章
 * @create 2018-12-15 15:46
 */
public class EnshrineItem {
    private int goodsId;  //货物id
    private int id;       //评论人id
    private int decreaseFlag=0; //降价标志   0为有效1为无效
    private int validFlag=0;  //无效标志   0为有效1为无校


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

    public int getDecreaseFlag() {
        return decreaseFlag;
    }

    public void setDecreaseFlag(int decreaseFlag) {
        this.decreaseFlag = decreaseFlag;
    }

    public int getValidFlag() {
        return validFlag;
    }

    public void setValidFlag(int validFlag) {
        this.validFlag = validFlag;
    }
}
