package com.haizhang.entitiyList;

import com.haizhang.entity.GoodsInfo;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * 新上架商品列表
 *
 * @author 海章
 * @create 2018-12-12 0:14
 */
public class NewGoodList {
    private List<GoodsInfo> newGoodList;
    public List<GoodsInfo> getNewGoodList() {
        return newGoodList;
    }
    public void setNewGoodList(List<GoodsInfo> newGoodList) {
        this.newGoodList = newGoodList;
    }
}
