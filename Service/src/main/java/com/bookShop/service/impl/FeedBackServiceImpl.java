package com.bookShop.service.impl;

import com.bookShop.mapper.FeedBackMapper;
import com.bookShop.service.FeedBackService;
import com.haizhang.entity.Feedback;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class FeedBackServiceImpl implements FeedBackService {
    @Resource
    FeedBackMapper feedBackMapper;

    @Override
    public Feedback queryShopFeedBackInfo(int userId) {
        return feedBackMapper.queryShopFeedBackInfo(userId);
    }

    @Override
    public int deleteFeedBack(Feedback feedback) {
        return feedBackMapper.deleteFeedBack(feedback);
    }

    @Override
    public int insertFeedBack(Feedback feedback) {
        return feedBackMapper.insertFeedBack(feedback);
    }

}
