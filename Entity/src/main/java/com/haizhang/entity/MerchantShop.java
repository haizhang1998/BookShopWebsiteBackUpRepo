package com.haizhang.entity;
import java.io.Serializable;
import java.util.List;

/**
 * 商家信息
 *
 * @author 海章
 * @create 2018-11-12 15:27
 */
public class MerchantShop  implements Serializable {
    private int merchantId;                           //卖家的账号ID
    private String addr;                                //发货地址
    private String shopName;                               //店铺名称
    private String shopLogo;                           //商家图标地址
    private List<GoodsInfo> possessGoods;              //拥有的商品信息
    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopLogo() {
        return shopLogo;
    }

    public void setShopLogo(String shopLogo) {
        this.shopLogo = shopLogo;
    }

    public List<GoodsInfo> getPossessGoods() {
        return possessGoods;
    }

    public void setPossessGoods(List<GoodsInfo> possessGoods) {
        this.possessGoods = possessGoods;
    }
}
