package com.bookShop.service;

import com.haizhang.entitiyList.PersonalCart;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.OrderItem;
import com.haizhang.entity.OrderItemCustom;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Austin
 * @date 2019/5/4
 */
public interface OrderService {
    //用户添加订单；(当用户点击了付款后执行)
    public boolean addUserOrders(PersonalCart cart, OrderItem orderItem) throws SQLException;

    //确认收货
    public boolean acceptGood(int userId, int goodsId, int payFlag);

    //得到该账户的所有订单
    public List<OrderItemCustom> getUserOrders(int userId) throws SQLException;

    //取消订单
    public boolean deleteOrder(int orderId) throws SQLException;

    //查询sendflag状态的货物
    public List<OrderItemCustom> getUserOrderBySendFlag(int userId, int sendFlag) throws SQLException;

    //查询payFlag状态的货物
    public List<OrderItemCustom> getUserOrderByPayFlag(int userId, int payFlag) throws SQLException;

    //更改订单状态
    public boolean modifylOrderFlag(int orderId,int orderFlag) throws SQLException;

    //退款退货
    public boolean modifybackFlag(int orderId) throws SQLException;

    //更改货物状态
    public boolean modifysendFlag(int orderId,int sendFlag) throws SQLException;

    //查询orderFlag状态的货物
    public List<OrderItemCustom> getUserOrderByOrderFlag(@Param("userId") int userId,@Param("orderFlag") int orderFlag) throws SQLException;


    /*****************************************管理员***********************************************/

    //商家查询用户购买的订单
    public List<OrderItemCustom> getManagerOrder(int merchantId) throws SQLException;

    //商家查询待发货订单
    public List<OrderItemCustom> getManagerReadyOrder(int merchantId,int sendFlag,int payFlag,int backFlag,int orderFlag) throws SQLException;

    //商家查询退款退货订单
    public List<OrderItemCustom> getManagerReturnMoney(int merchantId, int backFlag,int orderFlag) throws SQLException;

    //商家查询待付款订单
    public List<OrderItemCustom> getManagerByPayFlag(int merchantId, int payFlag,int orderFlag) throws SQLException;

    //商家发货
    public boolean modifyManagerSendFlag(int orderId,int sendFlag) throws SQLException;

    //更改商家货物状态
    public boolean modifyManagerOrderFlag(int orderId,int orderFlag) throws Exception;

    //商家退款退货
    public boolean agreeOrder(int orderId,int backFlag,int orderFlag) throws Exception;

}
