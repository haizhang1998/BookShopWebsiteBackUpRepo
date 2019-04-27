package com.bookShop.service.impl;

import com.bookShop.exception.GoodsNotFoundException;
import com.bookShop.mapper.GoodsMapper;
import com.bookShop.service.GoodService;
import com.haizhang.entity.GoodsInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class GoodServiceImpl implements GoodService {

    @Resource
    GoodsMapper goodsMapper;

    /**
     * 查询所有货物
     * @return 返回 goodsId  ===>  GoodsInfo
     */
    @Override
    public HashMap<Integer, GoodsInfo> getAllGoods() {
        return goodsMapper.getAllGoods();
    }

    /**
     * 根据指定goodsId
     * 或者goodsName
     * 得到指定货物的全部信息
     * @param goodsInfo
     * @return
     */
    @Override
    public GoodsInfo queryGoodsByGoodsInfo(GoodsInfo goodsInfo)  {
       GoodsInfo goods=goodsMapper.queryGoodsByGoodsInfo(goodsInfo);
       if(goods==null)throw new GoodsNotFoundException("未找到指定货物");
       return goods;
    }

    @Override
    public List<GoodsInfo> getAllNewGood() {
        return goodsMapper.getAllNewGood();
    }

    @Override
    public List<GoodsInfo>  queryGoodsInVague(GoodsInfo goodsInfo) {
        return goodsMapper.queryGoodsInVague(goodsInfo);
    }


    /**
     * 得到商铺所有商品
     * @param merchantId 商家id即userId
     * @return 商家持有的商品列表
     */
    @Override
    public List<GoodsInfo> queryShopGoods(int merchantId) {
        return goodsMapper.queryShopGoods(merchantId);
    }
}
