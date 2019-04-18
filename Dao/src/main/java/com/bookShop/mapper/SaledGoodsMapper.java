package com.bookShop.mapper;
import com.haizhang.entity.SaledInfo;
import java.util.HashMap;
import java.util.List;

public interface SaledGoodsMapper {
    //获取所有出售货物的信息。  编号===出售货物具体信息
    public HashMap<Integer, SaledInfo> getAllSaledInfo();
    //得到指定的出售货物
    public SaledInfo getSaledNumberById(int goodsId);
    //得到热销销量前14的商品
    public List<SaledInfo> getHotGoods();

}
