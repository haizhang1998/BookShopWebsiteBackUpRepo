package com.haizhang.entitiyList;

import com.haizhang.entity.GoodsInfo;
import java.util.List;

/**
 * 存放热销产品的javabean
 *
 * @author 海章
 * @create 2018-12-12 0:11
 */
public class HotGoodList {
    //热销产品列表
    private List<GoodsInfo> hotGoodList;
    public List<GoodsInfo> getHotGoodList() {
        return hotGoodList;
    }
    public void setHotGoodList(List<GoodsInfo> hotGoodList) {
        this.hotGoodList = hotGoodList;
    }
}
