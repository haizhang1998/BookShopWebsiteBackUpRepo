package com.bookShop.service;

import com.haizhang.entity.GoodsInfo;
import org.apache.ibatis.annotations.MapKey;

import java.util.HashMap;
import java.util.List;

public interface GoodService {
    //获取所有货物信息，HashMap，键值对===  货物编号====货物信息

    public HashMap<Integer, GoodsInfo> getAllGoods();

    //根据指定goodsId或者goodsName查询货物
    public GoodsInfo queryGoodsByGoodsInfo(GoodsInfo goodsInfo);

    //得到所有新上架的商品
    public List<GoodsInfo> getAllNewGood();

    //实现商品名、商品类型、地址的模糊查询
    public List<GoodsInfo>  queryGoodsInVague(GoodsInfo goodsInfo);
    //得到商铺所有商品
    public List<GoodsInfo> queryShopGoods(int merchantId);
}
