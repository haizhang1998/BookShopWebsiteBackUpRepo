package com.bookShop.service;

import com.haizhang.entity.SaledInfo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface SaledGoodsService {

    //获取所有出售货物的信息。  编号===出售货物具体信息
    public HashMap<Integer, SaledInfo> getAllSaledInfo();
    //得到指定的出售货物
    public SaledInfo getSaledNumberById(int goodsId);
    //得到热销销量前14的商品
    public List<SaledInfo> getHotGoods();
    //删除指定的销售记录
    public boolean deleteSaledInfoByGoodsId(int goodsId);
    //更新出售货物
    public boolean updateSaledGoods(@Param("goodsId")int goodsId, @Param("saledNumber") int saledNumber);
    //新增销售货物记录(上架一个商品时新增)
    public boolean addSaledGoodsRecord(int goodsId,int merhcantId);

}
