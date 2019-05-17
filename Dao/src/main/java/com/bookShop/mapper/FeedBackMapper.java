package com.bookShop.mapper;

import com.haizhang.entity.Feedback;

public interface FeedBackMapper {
    //获取开店请求的反馈信息
    public Feedback queryShopFeedBackInfo(int userId);

    //删除反馈记录
    public int deleteFeedBack(Feedback feedback);

    //插入feedBack记录
    public int insertFeedBack(Feedback feedback);

}
