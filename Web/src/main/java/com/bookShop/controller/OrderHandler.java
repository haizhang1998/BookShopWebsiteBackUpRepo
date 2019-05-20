package com.bookShop.controller;

import com.bookShop.service.GoodService;
import com.bookShop.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.haizhang.entity.GoodsInfo;
import com.haizhang.entity.OrderItem;
import com.haizhang.entity.OrderItemCustom;
import com.haizhang.entity.UserInfo;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.ModelResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * @author Austin
 * @date 2019/5/6
 */

@Controller
@RequestMapping("/order")
public class OrderHandler {
    @Resource
    GoodService goodServiceImpl;
    @Resource
    OrderService orderServiceImpl;


    /**
     * 进入订单界面
     * @param
     * @return
     */
    @RequestMapping("/allOrder")
    public String queryAllOrder(Model model, HttpSession session) throws
            SQLException{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        //PageHelper.startPage(1,2);
        List<OrderItemCustom> orderItem = orderServiceImpl.getUserOrders(userInfo.getId());
        //PageInfo<OrderItemCustom> page = new PageInfo<>(orderItem);
        for(OrderItem order:orderItem){
            System.out.println(order);
        }
        //long total = page.getTotal();
        //System.out.println("共有商品"+total);
        model.addAttribute("orderItem",orderItem);
        return "userOrderManage";
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(int orderId, Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        boolean flag = orderServiceImpl.deleteOrder(orderId);
        if(flag==true){
            List<OrderItemCustom> orderItem = orderServiceImpl.getUserOrders(userInfo.getId());
            model.addAttribute("orderItem",orderItem);
        }
        return "userOrderManage";
    }

    @RequestMapping("/getUserOrderByPayFlag")
    public String getUserOrderByPayFlag(int payFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getUserOrderByPayFlag(userInfo.getId(),payFlag);
        model.addAttribute("orderItem",orderItem);
        return "userOrderManage";
    }

    @RequestMapping("/getUserOrderBySendFlag")
    public String getUserOrderBySendFlag(int sendFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getUserOrderBySendFlag(userInfo.getId(),sendFlag);
        model.addAttribute("orderItem",orderItem);
        return "userOrderManage";
    }

    @RequestMapping("/getUserOrderByOrderFlag")
    public String getUserOrderByOrderFlag(int orderFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getUserOrderByOrderFlag(userInfo.getId(),orderFlag);
        model.addAttribute("orderItem",orderItem);
        return "userOrderManage";
    }

    @RequestMapping("/modifyOrderFlag")
    public String modifyOrderFlag(int orderFlag, int orderId, Model model,HttpSession session) throws SQLException{
        System.out.println("search:"+orderFlag);
        boolean flag = orderServiceImpl.modifylOrderFlag(orderId,orderFlag);
        String url = queryAllOrder(model,session);
        return url;
    }

    @RequestMapping(value ="/modifybackFlag/{orderId}",method = RequestMethod.GET)
    public String modifylbackFlag(@PathVariable int orderId, Model model,HttpSession session) throws SQLException{
        boolean flag = orderServiceImpl.modifybackFlag(orderId);
        String url = queryAllOrder(model,session);
        return url;
    }

    @RequestMapping("/modifysendFlag")
    public String modifysendFlag(int orderId,int sendFlag, Model model,HttpSession session) throws SQLException{
        boolean flag = orderServiceImpl.modifysendFlag(orderId,sendFlag);
        boolean flag2 = orderServiceImpl.modifylOrderFlag(orderId,1);
        String url = queryAllOrder(model,session);
        System.out.println(flag);
        System.out.println(flag2);
        return url;
    }


    /*****************************************管理员**********************************************/
    @RequestMapping("/getManagerOrder")
    public String getManagerOrder(Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getManagerOrder(userInfo.getId());
        model.addAttribute("orderItem",orderItem);
        return "ManagerOrderManage";
    }

    @RequestMapping("/getManagerReadyOrder")
    public String getManagerReadyOrder(int orderFlag,int sendFlag,int payFlag,int backFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        System.out.println(orderFlag+"  "+sendFlag+"  "+payFlag+"  "+backFlag);
        List<OrderItemCustom> orderItem = orderServiceImpl.getManagerReadyOrder(userInfo.getId(),sendFlag,payFlag,backFlag,orderFlag);
        System.out.println(orderItem.size());
        model.addAttribute("orderItem",orderItem);
        return "ManagerOrderManage";
    }

    @RequestMapping("/getManagerReturnMoney")
    public String getManagerReturnMoney(int orderFlag,int backFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getManagerReturnMoney(userInfo.getId(),backFlag,orderFlag);
        System.out.println(orderItem.size());
        model.addAttribute("orderItem",orderItem);
        return "ManagerOrderManage";
    }

    @RequestMapping("/getManagerByPayFlag")
    public String getManagerByPayFlag(int orderFlag,int payFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        List<OrderItemCustom> orderItem = orderServiceImpl.getManagerByPayFlag(userInfo.getId(),payFlag,orderFlag);
        System.out.println(orderItem.size());
        model.addAttribute("orderItem",orderItem);
        return "ManagerOrderManage";
    }

    @RequestMapping("/modifyManagerSendFlag")
    public String modifyManagerSendFlag(int orderId,int sendFlag,Model model, HttpSession session) throws
            Exception{
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        boolean flag = orderServiceImpl.modifyManagerSendFlag(orderId,sendFlag);
        List<OrderItemCustom> orderItem = orderServiceImpl.getManagerOrder(userInfo.getId());
        model.addAttribute("orderItem",orderItem);
        return "ManagerOrderManage";
    }

    @RequestMapping("/modifyManagerOrderFlag")
    public String modifyManagerOrderFlag(int orderFlag, int orderId, Model model,HttpSession session) throws Exception{
        boolean flag = orderServiceImpl.modifyManagerOrderFlag(orderId,orderFlag);
        String url = getManagerOrder(model,session);
        return url;
    }


    @RequestMapping("/agreeOrder")
    public String agreeOrder(int backFlag,int orderFlag, int orderId, Model model,HttpSession session) throws Exception{
        boolean flag = orderServiceImpl.agreeOrder(orderId,backFlag,orderFlag);
        String url = getManagerOrder(model,session);
        return url;
    }

    @RequestMapping("/deleteManagerOrder")
    public String deleteManagerOrder(int orderId, Model model, HttpSession session) throws
            Exception{
        boolean flag = orderServiceImpl.deleteOrder(orderId);
        String url = getManagerOrder(model,session);
        return url;
    }

}
