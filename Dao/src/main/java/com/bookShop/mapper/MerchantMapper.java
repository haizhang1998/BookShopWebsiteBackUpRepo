package com.bookShop.mapper;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.MerchantShop;
import com.haizhang.entity.OrderItem;
import java.sql.SQLException;
import java.util.List;

public interface MerchantMapper {
    //注册商家
    public boolean regMerchant(int userId, String addr, String shopLogo, String shopName);
     //得到商铺信息
    public MerchantShop getShopInfoByName(String ShopName) throws SQLException;
    //得到商铺信息by userId
    public MerchantShop getShopInfoByMerchantId(int userId) throws SQLException;
    //得到所有的商铺
    public List<MerchantShop> getAllShop() throws SQLException;

    //上架货物
    public boolean upGoods(GoodsInfo goodsInfo);

    //发货
    public boolean sendGood(int goodsId, int userId, int merchantId, int payFlag);


    //下架货物
    public boolean downGoods(int goodsId, int userId);


    //获取所有的商店货物
    public List<GoodsInfo> getAllShopGood(int merchantId);

    //查询所有订单
    public List<OrderItem> getAllUserOrder(int merchantId) throws SQLException;
}
