package com.haizhang.entity;

import java.io.Serializable;
import java.util.Date;

public class GoodsInfo implements Serializable {
    private String goodsName; //商品名称
    private String imgDir; //图片地址
    private double price;  //商品价格
    private String detail; //商品信息
    private int goodsId;  //商品的id
	private String addr;  //商品的发货地址
	private int possesserId; //拥有该商品的id
	private int remainNumber; //库存
	private String type;  //书籍种类
	private Date upTime;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpTime() {
		return upTime;
	}

	public void setUpTime(Date upTime) {
		this.upTime = upTime;
	}

	/**
     * 
     * @param goodsName 商品名称
     * @param imgDir  图片路径
     * @param price   价格
     * @param detail  商品描述信息
     */  
    public GoodsInfo(int goodsId, String goodsName, String imgDir, int price, String detail){
    	this.goodsName=goodsName;
    	this.goodsId=goodsId;
    	this.imgDir=imgDir;
    	this.price=price;
    	this.detail=detail;
    }
    public GoodsInfo(){

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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getPossesserId(){
    	return possesserId;
	}

	public void setPossesserId(int possesserId) {
		this.possesserId = possesserId;
	}

	public int getRemainNumber() {
		return remainNumber;
	}

	public void setRemainNumber(int remainNumber) {
		this.remainNumber = remainNumber;
	}

}
