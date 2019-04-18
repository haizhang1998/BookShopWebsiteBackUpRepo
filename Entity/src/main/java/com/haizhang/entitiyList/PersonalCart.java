package com.haizhang.entitiyList;

import com.haizhang.entity.CartItem;
import java.util.HashMap;
import java.util.Map;

/**
 * 我的购物车
 *
 * @author 海章
 * @create 2018-11-28 15:32
 */
public class PersonalCart {
   //购物车的总物品;key=物品编号 value=物品信息
   private Map<Integer, CartItem> cart=new HashMap<Integer, CartItem>();
   //购物车的总数目
   private int allGoodsCount;
   //购物车的总价格
   private double totalMoney;

   public Map<Integer, CartItem> getCart() {
      return cart;
   }

   public void setCart(Map<Integer, CartItem> cart) {
      this.cart = cart;
   }

   public int getAllGoodsCount() {
      return allGoodsCount;
   }

   public void setAllGoodsCount(int allGoodsCount) {
      this.allGoodsCount = allGoodsCount;
   }

   public double getTotalMoney() {
      return totalMoney;
   }

   public void setTotalMoney(double totalMoney) {
      this.totalMoney = totalMoney;
   }
}
