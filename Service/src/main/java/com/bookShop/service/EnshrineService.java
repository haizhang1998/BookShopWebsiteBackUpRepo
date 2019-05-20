package com.bookShop.service;

import com.haizhang.entity.EnshrineItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnshrineService {
    //获取收藏夹所有货物
    public List<EnshrineItem> getAllEnshrineGood(int userId);

    //删除收藏夹的指定商品
    public boolean removeEnshrineGood(int userId, int goodsId);

    //添加收藏夹的商品
    public boolean addEnshrineGood(int userId, int goodsId);

    //修改收藏商品的Valid状态 （下架货物时直接为1，不许传参数，状态不可逆）
    public boolean updateValidStatus( int goodsId);

    /**
     *修改商品的降价状态
     * @return
     */
    public boolean updatePriceFlagStatus(double newPrice,double oldPrice,int goodsId);


    }
