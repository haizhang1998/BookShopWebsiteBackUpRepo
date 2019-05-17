package com.bookShop.mapper;

import com.haizhang.entity.Freezerecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FreezeRecordMapper {
    //获取所有冻结的列表数
    public int queryFreezeCount();
    //获取指定的冻结记录
    public List<Freezerecord> queryIndentifyFreezeRecord(Freezerecord freezerecord);
    //获取冻结记录 分页 limit表示一页多少个
    public List<Freezerecord> queryRecordByPage(@Param("limit") int limit,@Param("offset") int offset);
    //插入一条冻结记录
    public int insertFreezeRecord(Freezerecord freezerecord);
    //删除一条或多条冻结记录
    public int deleteFreezeRecord(@Param("ids") List<Integer>ids);
}
