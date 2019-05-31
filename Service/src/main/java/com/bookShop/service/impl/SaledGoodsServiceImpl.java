package com.bookShop.service.impl;

import com.bookShop.exception.SaledGoodsInfoNotFound;
import com.bookShop.mapper.SaledGoodsMapper;
import com.bookShop.service.SaledGoodsService;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.SaledInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class SaledGoodsServiceImpl implements SaledGoodsService {
    @Resource
    SaledGoodsMapper saledGoodsMapper;

    @Override
    public HashMap<Integer, SaledInfo> getAllSaledInfo() {
        return  saledGoodsMapper.getAllSaledInfo();
    }

    @Override
    public SaledInfo getSaledNumberById(int goodsId) {
       SaledInfo saledInfo=saledGoodsMapper.getSaledNumberById(goodsId);
       if(saledInfo==null)throw new SaledGoodsInfoNotFound("出售货物信息未找到！");
       return saledInfo;
    }

    @Override
    public List<SaledInfo> getHotGoods() {
        return  saledGoodsMapper.getHotGoods();
    }

    @Override
    public boolean deleteSaledInfoByGoodsId(int goodsId) {
        return false;
    }

    @Override
    public boolean updateSaledGoods(int goodsId, int saledNumber) {
        return false;
    }

    @Override
    public boolean addSaledGoodsRecord(int goodsId,int merhcantId) {
        SaledInfo saledInfo=new SaledInfo();
        saledInfo.setGoodsId(goodsId);
        saledInfo.setMerchantId(merhcantId);
        saledInfo.setSaledNumber(0);
        saledInfo.setSaledDate(new Date());
        return saledGoodsMapper.addSaledGoodsRecord(saledInfo);
    }
}
