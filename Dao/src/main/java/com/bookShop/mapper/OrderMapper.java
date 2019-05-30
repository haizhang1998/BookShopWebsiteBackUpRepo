package com.bookShop.mapper;

import com.haizhang.entitiyList.PersonalCart;
import com.haizhang.entity.CartItem;
import com.haizhang.entity.OrderItem;
import com.haizhang.entity.OrderItemCustom;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import java.sql.SQLException;
import java.util.List;

/**
 * @author Austin
 * @date 2019/5/18
 */
public interface OrderMapper {
    /*******************************用户端******************************************/

    //用户查询订单状态；
    public List<OrderItem> getAllSubmitOrders(int userId) throws SQLException;

    //用户添加订单；(当用户点击了付款后执行)
    public boolean addUserOrders(PersonalCart cart, OrderItem orderItem) throws SQLException;

    //确认收货
    public boolean acceptGood(int userId, int goodsId, int payFlag);

    /*********************************************/

    //得到该账户的所有订单
    public List<OrderItemCustom> getUserOrders(int userId) throws SQLException;

    //删除订单
    public boolean deleteOrder(@Param("orderId") int orderId) throws SQLException;


    //查询sendflag状态的货物
    public List<OrderItemCustom> getUserOrderBySendFlag(@Param("userId") int userId,@Param("sendFlag") int sendFlag) throws SQLException;

    //查询payFlag状态的货物
    public List<OrderItemCustom> getUserOrderByPayFlag(@Param("userId") int userId,@Param("payFlag") int payFlag) throws SQLException;

    //查询orderFlag状态的货物
    public List<OrderItemCustom> getUserOrderByOrderFlag(@Param("userId") int userId,@Param("orderFlag") int orderFlag) throws SQLException;

    //更改订单状态
    public boolean modifyOrderFlag(@Param("orderId") int orderId, @Param("orderFlag") int orderFlag) throws SQLException;

    //退款退货
    public boolean modifybackFlag(@Param("orderId") int orderId) throws SQLException;

    //更改货物状态
    public boolean modifysendFlag(@Param("orderId") int orderId,@Param("sendFlag") int sendFlag) throws SQLException;

    /************************************管理员端**************************************/
    //商家查询用户购买的订单
    public List<OrderItemCustom> getManagerOrder(int merchantId) throws SQLException;

    //商家查询待发货订单
    public List<OrderItemCustom> getManagerReadyOrder(@Param("merchantId") int merchantId,@Param("sendFlag") int sendFlag,@Param("payFlag") int payFlag,@Param("backFlag") int backFlag,@Param("orderFlag") int orderFlag) throws SQLException;

    //商家查询退款退货订单
    public List<OrderItemCustom> getManagerReturnMoney(@Param("merchantId") int merchantId,@Param("backFlag") int backFlag,@Param("orderFlag") int orderFlag) throws SQLException;

    //商家查询待付款订单
    public List<OrderItemCustom> getManagerByPayFlag(@Param("merchantId") int merchantId,@Param("payFlag") int payFlag,@Param("orderFlag") int orderFlag) throws SQLException;

    //商家发货
    public boolean modifyManagerSendFlag(@Param("orderId") int orderId,@Param("sendFlag") int sendFlag) throws SQLException;

    //商家退款退货
    public boolean agreeOrder(@Param("orderId") int orderId,@Param("backFlag") int backFlag,@Param("orderFlag") int orderFlag) throws Exception;

}
