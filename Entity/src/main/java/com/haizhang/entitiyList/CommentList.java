package com.haizhang.entitiyList;

import com.haizhang.entity.CommentItem;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

/**
 * 获取封装用户评论的javabean
 * @author 海章
 * @create 2018-12-14 21:12
 */
public class CommentList implements Serializable {
    private int totalNumber;//总评价数
    private HashMap<Integer, CommentItem> commentItemList;

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    public HashMap<Integer, CommentItem> getCommentItemList() {
        return commentItemList;
    }

    public void setCommentItemList(HashMap<Integer, CommentItem> commentItemList) {
        this.commentItemList = commentItemList;
    }
}
