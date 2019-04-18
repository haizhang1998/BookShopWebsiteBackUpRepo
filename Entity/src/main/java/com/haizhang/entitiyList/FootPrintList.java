package com.haizhang.entitiyList;

import com.haizhang.entity.GoodsInfo;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

/**
 * 我的足迹列表
 *
 * @author 海章
 * @create 2018-12-16 10:18
 */
public class FootPrintList implements Serializable {
    //用于存放  时间===足迹
    private HashMap<String,List<GoodsInfo>> footPrintList;
    //总数
    private int footPrintNumber;

    public HashMap<String, List<GoodsInfo>> getFootPrintList() {
        return footPrintList;
    }

    public void setFootPrintList(HashMap<String, List<GoodsInfo>> footPrintList) {
        this.footPrintList = footPrintList;
    }

    public int getFootPrintNumber() {
        return footPrintNumber;
    }

    public void setFootPrintNumber(int footPrintNumber) {
        this.footPrintNumber = footPrintNumber;
    }
}
