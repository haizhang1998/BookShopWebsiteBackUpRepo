package com.bookShop.service.impl;

import com.bookShop.mapper.MerchantMapper;
import com.bookShop.service.MerchantService;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.MerchantShop;
import com.haizhang.entity.OrderItem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;
@Service("merchantServiceImpl")
public class MerchantServiceImpl implements MerchantService {

    @Resource
    MerchantMapper merchantMapper;

    @Override
    public boolean regMerchant(int userId, String addr, String shopLogo, String shopName) {
        return false;
    }

    @Override
    public MerchantShop getShopInfoByName(String ShopName) {
        return null;
    }

    @Override
    public MerchantShop getShopInfoByMerchantId(int userId) {
        return null;
    }

    @Override
    public List<MerchantShop> getAllShop() {
        return merchantMapper.getAllShop();
    }

    @Override
    public boolean upGoods(GoodsInfo goodsInfo) {
        return false;
    }

    @Override
    public boolean sendGood(int goodsId, int userId, int merchantId, int payFlag) {
        return false;
    }

    @Override
    public boolean downGoods(int goodsId, int userId) {
        return false;
    }

    @Override
    public List<OrderItem> getAllUserOrder(int merchantId) {
        return null;
    }

    @Override
    public List<MerchantShop> getRankShop(int number) {
        return number<=0?null:merchantMapper.getRankShop(number);
    }
}
