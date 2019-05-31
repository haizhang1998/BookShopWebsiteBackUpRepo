package com.bookShop.service.impl;

import com.bookShop.mapper.EnshrineMapper;
import com.bookShop.service.EnshrineService;
import com.haizhang.entity.EnshrineItem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EnshrineServiceImpl implements EnshrineService {
    @Resource
    EnshrineMapper enshrineMapper;

    @Override
    public List<EnshrineItem> getAllEnshrineGood(int userId) {
        return null;
    }

    @Override
    public boolean removeEnshrineGood(int userId, int goodsId) {
        return false;
    }

    @Override
    public boolean addEnshrineGood(int userId, int goodsId) {
        return false;
    }

    @Override
    public boolean updateValidStatus(int goodsId) {
        return enshrineMapper.updateValidStatus(goodsId);
    }

    @Override
    public boolean updatePriceFlagStatus(double newPrice,double oldPrice,int goodsId) {
        EnshrineItem enshrineItem=new EnshrineItem();
        double changePrice=newPrice-oldPrice;
        int updatePriceFlag=(changePrice>0?1:(changePrice<0?-1:0));
        enshrineItem.setChangePrice(Math.abs(changePrice));
        enshrineItem.setGoodsId(goodsId);
        enshrineItem.setUpdatePriceFlag(updatePriceFlag);
        System.err.println(updatePriceFlag);
        return enshrineMapper.updatePriceFlagStatus(enshrineItem);
    }
}
