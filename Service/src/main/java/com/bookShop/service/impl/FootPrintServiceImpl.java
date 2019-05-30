package com.bookShop.service.impl;
import com.bookShop.mapper.FootPrintMapper;
import com.bookShop.service.FootPrintService;
import com.haizhang.entity.FootPrintItem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FootPrintServiceImpl implements FootPrintService{
    @Resource
    FootPrintMapper footPrintMapper;

    @Override
    public List<FootPrintItem> getAllFootPrint(int userId){
        return footPrintMapper.getAllFootPrint(userId);
    }

    @Override
    public boolean addFootPrint(int goodsId, int userId,String goodsName, String imgDir, Date time){
        return footPrintMapper.addFootPrint(goodsId,userId,goodsName,imgDir, time);
    }

    @Override
    public boolean delFootPrint(int userId,int goodsId){
        return footPrintMapper.delFootPrint(userId, goodsId);
    }

}
