package com.bookShop.mapper;
import com.haizhang.entity.GoodsInfo;
import java.util.HashMap;
import java.util.List;

public interface GoodsMapper {
    //获取所有货物信息，HashMap，键值对===  货物编号====货物信息
    public HashMap<Integer, GoodsInfo> getAllGoods();

    //根据指定的Id号得到指定货物的全部信息
    public GoodsInfo getGoodsById(int goodsId);

    //得到所有新上架的商品
    public List<GoodsInfo> getAllNewGood();

    //实现商品名、商品类型的模糊查询
    public List<GoodsInfo> queryGoods(String goodsName, String type);

     //得到商铺所有商品
    public List<GoodsInfo> queryShopGoods(int merchantId);
}
