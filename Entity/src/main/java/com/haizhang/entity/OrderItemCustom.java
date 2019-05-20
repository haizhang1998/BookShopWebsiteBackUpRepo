package com.haizhang.entity;

/**
 * @author Austin
 * @date 2019/5/18
 */
public class OrderItemCustom extends OrderItem {
    private String shopName;  //店铺名称
    private String goodsName; //商品名称
    private String imgDir;    //商品图片
    private double price;     //商品价格

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getImgDir() {
        return imgDir;
    }

    public void setImgDir(String imgDir) {
        this.imgDir = imgDir;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
