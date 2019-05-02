package com.bookShop.mapper;
import com.haizhang.entity.CommentItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 评论信息的数据库处理接口
 */
public interface CommentMapper {
    //获取商品所有的评价
    public List<CommentItem> getAllCommentOfGood(int goodsId);

    //发送评价
    public boolean sendCommentItem(CommentItem commentItem);

    //删除评价

    public boolean deleteCommentItem(@Param("userId") int userId, @Param("goodsId") int goodsId);

    //得到某一个用户对商品的评价，可以判断是否追加评价
    public CommentItem  getOneUserComment(@Param("userId") int userId, @Param("goodsId") int goodsId);



}
