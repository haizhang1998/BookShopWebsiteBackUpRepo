package com.bookShop.service;

import com.bookShop.exception.FreezeRecordExistException;
import com.bookShop.mapper.FreezeRecordMapper;
import com.bookShop.service.impl.FreezerecordServiceImpl;
import com.haizhang.entity.Freezerecord;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;
import java.util.List;

public interface FreezerecordService {


    //获取所有冻结的列表数
    public int queryFreezeCount();
    //获取指定的冻结记录
    public List<Freezerecord> queryIndentifyFreezeRecord(Freezerecord freezerecord);
    //获取冻结记录 分页 limit表示一页多少个
    public List<Freezerecord> queryRecordByPage(int limit,int offset);
    //插入一条冻结记录
    public int insertFreezeRecord(Freezerecord freezerecord)throws FreezeRecordExistException;
    //删除一条或多条冻结记录
    public int deleteFreezeRecord(List<Integer>ids);
}
