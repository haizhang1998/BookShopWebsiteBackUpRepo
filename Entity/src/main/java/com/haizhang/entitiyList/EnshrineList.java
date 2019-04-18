package com.haizhang.entitiyList;

import com.haizhang.entity.GoodsInfo;
import java.io.Serializable;
import java.util.List;

/**
 * 用户的收藏列表
 *
 * @author 海章
 * @create 2018-12-15 15:28
 */
public class EnshrineList implements Serializable {
    //收藏商品有效
    private List<GoodsInfo> validList;
    //收藏商品降价
    private List<GoodsInfo> decreaseList;
    //收藏商品无效（下架）
    private List<GoodsInfo> invalidList;
    //降价商品总数
    private int decreaseNumber;
    //下架商品总数
    private int invalidNumber;
    //有效商品总数
    private int validNumber;


    public int getDecreaseNumber() {
        return decreaseNumber;
    }

    public void setDecreaseNumber(int decreaseNumber) {
        this.decreaseNumber = decreaseNumber;
    }

    public int getInvalidNumber() {
        return invalidNumber;
    }

    public void setInvalidNumber(int invalidNumber) {
        this.invalidNumber = invalidNumber;
    }

    public int getValidNumber() {
        return validNumber;
    }

    public void setValidNumber(int validNumber) {
        this.validNumber = validNumber;
    }



    public List<GoodsInfo> getValidList() {
        return validList;
    }

    public void setValidList(List<GoodsInfo> validList) {
        this.validList = validList;
    }

    public List<GoodsInfo> getDecreaseList() {
        return decreaseList;
    }

    public void setDecreaseList(List<GoodsInfo> decreaseList) {
        this.decreaseList = decreaseList;
    }

    public List<GoodsInfo> getInvalidList() {
        return invalidList;
    }

    public void setInvalidList(List<GoodsInfo> invalidList) {
        this.invalidList = invalidList;
    }
}
