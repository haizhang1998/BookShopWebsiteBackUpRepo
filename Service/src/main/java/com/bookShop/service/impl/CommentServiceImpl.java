package com.bookShop.service.impl;

import com.bookShop.mapper.CommentMapper;
import com.bookShop.service.CommentService;
import com.haizhang.entity.CommentItem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    CommentMapper commentMapper;

    @Override
    public List<CommentItem> getAllCommentOfGood(int goodsId) {
        return commentMapper.getAllCommentOfGood(goodsId);
    }

    @Override
    public boolean sendCommentItem(CommentItem commentItem) {
        return commentMapper.sendCommentItem(commentItem);
    }

    @Override
    public boolean deleteCommentItem(int userId, int goodsId) {
        return commentMapper.deleteCommentItem(userId,goodsId);
    }

    @Override
    public CommentItem getOneUserComment(int userId, int goodsId) {
        return commentMapper.getOneUserComment(userId,goodsId);
    }
}
