package com.bookShop.mapper;

import com.haizhang.entity.RequestRecordShop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 获取开店请求
 */
public interface RequestShopRecordMapper {
    //获取所有的开店请求
    public List<RequestRecordShop> queryAllRequestshoprecord();

    //获取指定的开店请求by id
    public RequestRecordShop queryRequsetshoprecordById(int requestId);

    //删除开店请求
    public int deleteRequsetshoprecord(@Param("requestIds") List<Integer> requestIds);

    //插入开店请求
    public int insertRequsetshoprecord(RequestRecordShop requsetshoprecord);

    //获取用户开店记录
    public RequestRecordShop queryUserRecord(@Param("userId") int userId);

}
