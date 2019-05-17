package com.bookShop.service.impl;

import com.bookShop.mapper.RequestShopRecordMapper;
import com.bookShop.service.RequestShopRecordService;
import com.haizhang.entity.RequestRecordShop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RequestShopRecordServiceImpl implements RequestShopRecordService {
    @Resource
    RequestShopRecordMapper requestShopRecordMapper;


    /**
     * 查询所有申请开店信息
     * @return
     */
    @Override
    public List<RequestRecordShop> queryAllRequestshoprecord() {
        return requestShopRecordMapper.queryAllRequestshoprecord();
    }

    /**
     * 查询请求店铺信息靠id
     * @param requestId
     * @return
     */
    @Override
    public RequestRecordShop queryRequsetshoprecordById(int requestId) {
        return requestShopRecordMapper.queryRequsetshoprecordById(requestId);
    }

    /**
     * 删除申请记录
     * @param requestIds
     * @return
     */
    @Override
    public int deleteRequsetshoprecord(List<Integer> requestIds) {

        return requestShopRecordMapper.deleteRequsetshoprecord(requestIds);
    }

    @Override
    public String insertRequsetshoprecord(RequestRecordShop requsetshoprecord) {
        return requestShopRecordMapper.insertRequsetshoprecord(requsetshoprecord)>0?"发送申请成功!":"发送失败，请检查网络状态!";
    }

    @Override
    public RequestRecordShop queryUserRecord(int userId) {
        return requestShopRecordMapper.queryUserRecord(userId);
    }
}
