package com.bookShop.mapper;
import com.haizhang.entity.FootPrintItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FootPrintMapper {
    //得到所有足迹
    public List<FootPrintItem> getAllFootPrint(@Param("userId") int userId);
    /**
     *
     * @param userId
     * @param goodsId
     * @param time 时间
     * @return 1代表足迹在同一时间内存在，2代表失败，0代表不存在且添加成功
     */
    public String addFootPrint(@Param("userId") int userId,@Param("goodsId") int goodsId, @Param("time") String time);


}
