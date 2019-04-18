package com.bookShop.mapper;
import com.haizhang.entity.EnshrineItem;
import java.util.List;

public interface EnshrineMapper {
    //获取收藏夹所有货物
    public List<EnshrineItem> getAllEnshrineGood(int userId);

    //删除收藏夹的指定商品
    public boolean removeEnshrineGood(int userId, int goodsId);

    //添加收藏夹的商品
    public boolean addEnshrineGood(int userId, int goodsId);

}
