package com.haizhang.DTO;

/**
 * @author Austin
 * @date 2019/5/31
 * 订单详情的传输数据
 */
public class OrderDetailDTO {
    private int goodsId;  //商品编号
    private int num;  //购买数量
    private double price;   //商品单价

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
