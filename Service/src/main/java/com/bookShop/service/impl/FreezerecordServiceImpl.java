package com.bookShop.service.impl;

import com.bookShop.exception.FreezeRecordExistException;
import com.bookShop.mapper.FreezeRecordMapper;
import com.bookShop.service.FreezerecordService;
import com.haizhang.entity.Freezerecord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FreezerecordServiceImpl implements FreezerecordService {
    @Resource
    FreezeRecordMapper freezeRecordMapper;

    @Override
    public int queryFreezeCount() {
        return freezeRecordMapper.queryFreezeCount();
    }

    @Override
    public List<Freezerecord> queryIndentifyFreezeRecord(Freezerecord freezerecord) {
        return freezeRecordMapper.queryIndentifyFreezeRecord(freezerecord);
    }

    @Override
    public List<Freezerecord> queryRecordByPage(int limit, int offset) {
        return freezeRecordMapper.queryRecordByPage(limit,offset);
    }


    @Override
    public int insertFreezeRecord(Freezerecord freezerecord)throws FreezeRecordExistException {
        int count;
        try {
            count=freezeRecordMapper.insertFreezeRecord(freezerecord);
        }catch (Exception e){
            throw new FreezeRecordExistException("该用户的冻结记录已存在！");
        }
          return count;
    }


    @Override
    public int deleteFreezeRecord(List<Integer> ids) {
        return freezeRecordMapper.deleteFreezeRecord(ids);
    }
}
