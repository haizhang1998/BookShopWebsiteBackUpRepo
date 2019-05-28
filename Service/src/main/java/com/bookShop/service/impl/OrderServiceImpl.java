package com.bookShop.service.impl;

import com.bookShop.mapper.CartOrderMapper;
import com.bookShop.mapper.OrderMapper;
import com.bookShop.service.OrderService;
import com.haizhang.entitiyList.PersonalCart;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.OrderItem;
import com.haizhang.entity.OrderItemCustom;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Austin
 * @date 2019/5/4
 */

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    OrderMapper OrderMapper;

    @Override
    public boolean addUserOrders(PersonalCart cart, OrderItem orderItem) throws SQLException {
        return OrderMapper.addUserOrders(cart, orderItem);
    }

    @Override
    public boolean acceptGood(int userId, int goodsId, int payFlag) {
        return OrderMapper.acceptGood(userId,goodsId,payFlag);
    }

    @Override
    public List<OrderItemCustom> getUserOrders(int userId) throws SQLException {
        return OrderMapper.getUserOrders(userId);
    }

    @Override
    public boolean deleteOrder(int orderId) throws SQLException{
        return OrderMapper.deleteOrder(orderId);
    }


    public List<OrderItemCustom> getUserOrderBySendFlag(int userId,int sendFlag) throws SQLException{
        return OrderMapper.getUserOrderBySendFlag(userId,sendFlag);
    }


    public List<OrderItemCustom> getUserOrderByPayFlag(int userId,int payFlag) throws SQLException{
        return OrderMapper.getUserOrderByPayFlag(userId,payFlag);
    }


    public boolean modifylOrderFlag(int orderId, int orderFlag) throws SQLException{
        return OrderMapper.modifyOrderFlag(orderId,orderFlag);
    }

    public boolean modifybackFlag(int orderId) throws SQLException{
        return OrderMapper.modifybackFlag(orderId);
    }

    public boolean modifysendFlag(int orderId,int sendFlag) throws SQLException{
        return OrderMapper.modifysendFlag(orderId,sendFlag);
    }

    public List<OrderItemCustom> getUserOrderByOrderFlag(@Param("userId") int userId,@Param("orderFlag") int orderFlag) throws SQLException{
        return OrderMapper.getUserOrderByOrderFlag(userId,orderFlag);
    }

    /****************************************商家************************************************/

    //商家查询待发货订单
    public List<OrderItemCustom> getManagerReadyOrder(int merchantId,int sendFlag, int payFlag,int backFlag,int orderFlag) throws SQLException{
        return OrderMapper.getManagerReadyOrder(merchantId,sendFlag,payFlag,backFlag,orderFlag);
    }

    public List<OrderItemCustom> getManagerOrder(int merchantId) throws SQLException{
        return OrderMapper.getManagerOrder(merchantId);
    }

    //商家查询退款退货订单
    public List<OrderItemCustom> getManagerReturnMoney(int merchantId,int backFlag,int orderFlag) throws SQLException{
        return OrderMapper.getManagerReturnMoney(merchantId,backFlag,orderFlag);
    }

    //商家查询待付款订单
    public List<OrderItemCustom> getManagerByPayFlag(int merchantId,int payFlag,int orderFlag) throws SQLException{
        return OrderMapper.getManagerByPayFlag(merchantId,payFlag,orderFlag);
    }

    //商家发货
    public boolean modifyManagerSendFlag(int orderId,int sendFlag) throws SQLException{
        return OrderMapper.modifyManagerSendFlag(orderId,sendFlag);
    }

    public boolean modifyManagerOrderFlag(int orderId,int orderFlag) throws Exception{
        return OrderMapper.modifyOrderFlag(orderId,orderFlag);
    }

    public boolean agreeOrder(int orderId,int backFlag,int orderFlag) throws Exception{
        return OrderMapper.agreeOrder(orderId,backFlag,orderFlag);
    }

}
