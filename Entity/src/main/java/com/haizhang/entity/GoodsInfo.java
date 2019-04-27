package com.haizhang.entity;

import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class GoodsInfo implements Serializable {
	@NotNull(message = "货物名称不能为空")
    private String goodsName; //商品名称
	@Range(min =0,max =Long.MAX_VALUE,message = "价格不合法！")
	private double price;  //商品价格
	@Range(min =10,message = "请输入至少10个字的商品描述信息")
    private String detail; //商品信息
	@NotNull(message = "发货地址需非空")
	private String addr;  //商品的发货地址
	@Range(min =1,max =Long.MAX_VALUE,message = "库存不合法！")
	private int remainNumber; //库存
	@NotNull(message = "请选择书籍分类")
	private String type;  //书籍种类

	private int goodsId;  //商品的id
	private Date upTime;
	private int possesserId; //拥有该商品的id
	private String imgDir; //图片地址

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

	@Override
	public String toString() {
		return "GoodsInfo{" +
				"goodsName='" + goodsName + '\'' +
				", price=" + price +
				", detail='" + detail + '\'' +
				", addr='" + addr + '\'' +
				", remainNumber=" + remainNumber +
				", type='" + type + '\'' +
				", goodsId=" + goodsId +
				", upTime=" + upTime +
				", possesserId=" + possesserId +
				", imgDir='" + imgDir + '\'' +
				'}';
	}
}
