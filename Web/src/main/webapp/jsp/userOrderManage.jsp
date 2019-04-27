
<%--
  Created by IntelliJ IDEA.
  User: MrAustin
  Date: 2018/12/15
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/userOrderManage.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userInfo==null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
<html>
<head>
    <title>订单界面</title>

</head>
<script>
    $(document).ready(function () {


        $("#myFootPrint").click(function () {
            <c:choose>
            <c:when test="${sessionScope.userInfo==null}">
            window.location.href="index.jsp";
            </c:when>
            <c:otherwise>
            window.location.href="affair.do?action=getAllFootPrint&userId=${sessionScope.userInfo.id}";
            </c:otherwise>
            </c:choose>
        });
        $("#enshrine").click(function () {
            <c:choose>
            <c:when  test="${sessionScope.userInfo==null}">
            window.location.href="index.jsp";
            </c:when>
            <c:otherwise>
            window.location.href="affair.do?action=getEnshrineGoods&userId=${sessionScope.userInfo.id}";
            </c:otherwise>
            </c:choose>
        });
    });
</script>
<style>
    #goodsItemDiv{
        margin-top: 20px;
        border: 1px solid #e5e5e5;
        height:auto;
        float: left;
        width:900px;
        overflow: hidden;
        margin-bottom: 70px;

    }

    .goodsImg{
        width: 80px;
        height: 80px;

    }
    .goodsItemUl{
        list-style: none;
        float: left;
        overflow:hidden;
        height:140px;
        width:1100px;

    }
    .goodsItemLi{
        margin-left: 1px;
        height: 100px;
        overflow:hidden;
        float: left;
    }
    .operate-ul{
        float: left;
        list-style: none;
    }
    .operate-li a:hover{
        color: #f40;
    }
    .active{
        display: block;
    }
    .noActiv{
        display: none;
    }
</style>
<body>
<!-- 导航栏div -->
<div id="wrapper-top">
    <div id="nav" >
        <ul >
            <c:choose>

                <c:when test="${sessionScope.userInfo!=null}">
                    <li  class="li1">欢迎,${userInfo.name}</li>
                </c:when>

                <c:otherwise>
                    <li class="li1"> <a href="index.jsp" style="color: red">亲，请先登录</a></li>
                </c:otherwise>

            </c:choose>

            <li class="li1"> <a href="#" >个人中心</a></li>
            <li class="li1" ><a href="#" >消息 </a></li>
            <c:if test="${sessionScope.userInfo!=null}">
                <li class="li2" ><a href="logout.jsp" style="color: red;font-weight: bold">点我注销</a></li>
            </c:if>

            <li class="li2"><a href="Cart.do?action=getCart" style="float: left"><p style="float:left;display:inline-block;color: #ff4400;"><span>购物车&nbsp;${sessionScope.myCart.allGoodsCount}</span></p></a></li>
            <li class="li2"> <a id="enshrine">收藏夹</a> </li>
            <li class="li2"><a id="myFootPrint">我的足迹</a></li>
            <li class="li2"> <a href="openShop.jsp">我要开店</a></li>
            <li class="li2"><a href="affair.do?action=updateHotAndNew">返回首页</a></li>
            <li class="li2"><a href="affair.do?action=getUserOrders"> 我的订单</a>
            <li class="li2"><a href="merchantManage.jsp">卖家管理</a>
        </ul>
    </div>
</div>
    <div class="header-order">
            <div class="header-logo">
                <h1>我的订单</h1>
            </div>
            <div class="header-nav">
                <a href="">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">账户设置</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">消息</a>
            </div>
    </div>

    <div class="content">
        <div class="content-header">
            <a href="">所有订单</a><span >|</span>
            <a href="">待发货</a><span >|</span>
            <a href="">待收货</a><span >|</span>
            <a href="">待评价</a><span >|</span>
        </div>
        <hr>

        <div class="content-middle">
            <div class="content-middle-header">
                <div class="headerOfCartDivSon" style="width: 370px"><p class="headerOfCartFont"><span>商品详情</span></p></div>
                <div class="headerOfCartDivSon" style="width: 100px"><p class="headerOfCartFont"><span>单价</span></p></div>
                <div class="headerOfCartDivSon" style="width:100px"><p class="headerOfCartFont"><span>数量</span></p></div>
                <div class="headerOfCartDivSon" style="width:100px"><p class="headerOfCartFont"><span>实付款</span></p></div>
                <div class="headerOfCartDivSon" style="width:100px"><p class="headerOfCartFont"><span>交易状态</span></p></div>
                <div class="headerOfCartDivSon" style="width: 100px"><p class="headerOfCartFont"><span>交易操作</span></p></div>
            </div>


            <!-- 所有订单 -->
            <div id="goodsItemDiv">

                <!-- 待发货 ：已付款，货到付款  -->

                <div id="waitSendDiv" class="active">
                    <c:forEach var="orderItem" items="${sessionScope.userOrderList.waitPayList}" >
                        <ul class="goodsItemUl">
                            <div style="margin-top: 20px">
                                <li class="goodsItemLi">
                                    <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"  alt="图片加载中.....">
                                </li>
                                <li class="goodsItemLi">
                                    <a style="float: left;width: 186px;height: 80px">${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</a>
                                </li>
                                <li class="goodsItemLi" style="width: 100px;padding-left:70px">
                                    <p style="color: black;margin-top:20px" ><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span></p>
                                </li>
                                <li class="goodsItemLi" style="height: 100px;width: 100px;padding-left:24px">
                                    <p style="color: black;margin-top:20px" ><span>${orderItem.sumOfGoods}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>￥${orderItem.totalMoney}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>待发货</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px;margin-top:10px">
                                    <ul class="operate-ul"style="margin-top: 20px" >
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block">取消订单</a></li>
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系卖家</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </c:forEach>

                    <c:forEach var="orderItem" items="${sessionScope.userOrderList.waitPayList}" >
                        <ul class="goodsItemUl">
                            <div style="margin-top: 20px">
                                <li class="goodsItemLi">
                                    <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"  alt="图片加载中.....">
                                </li>
                                <li class="goodsItemLi">
                                    <a style="float: left;width: 186px;height: 80px">${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</a>
                                </li>
                                <li class="goodsItemLi" style="width: 100px;padding-left:70px">
                                    <p style="color: black;margin-top:20px" ><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span></p>
                                </li>
                                <li class="goodsItemLi" style="height: 100px;width: 100px;padding-left:24px">
                                    <p style="color: black;margin-top:20px" ><span>${orderItem.sumOfGoods}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>￥${orderItem.totalMoney}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>待发货</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px;margin-top:10px">
                                    <ul class="operate-ul"style="margin-top: 20px" >
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block">取消订单</a></li>
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系卖家</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </c:forEach>
                </div>

                <!--  待收货   -->
                <div id="waitGetDiv" class="active">
                    <c:forEach var="orderItem" items="${sessionScope.userOrderList.sendList}" >
                        <ul class="goodsItemUl">
                            <div style="margin-top: 20px">
                                <li class="goodsItemLi">
                                    <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"  alt="图片加载中.....">
                                </li>
                                <li class="goodsItemLi">
                                    <a style="float: left;width: 186px;height: 80px">${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</a>
                                </li>
                                <li class="goodsItemLi" style="width: 100px;padding-left:70px">
                                    <p style="color: black;margin-top:20px" ><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span></p>
                                </li>
                                <li class="goodsItemLi" style="height: 100px;width: 100px;padding-left:24px">
                                    <p style="color: black;margin-top:20px" ><span>${orderItem.sumOfGoods}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>￥${orderItem.totalMoney}</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px">
                                    <p style="color: black;margin-top:20px" ><span>待收货</span></p>
                                </li>
                                <li class="goodsItemLi" style="width:80px;margin-top:10px">
                                    <ul class="operate-ul"style="margin-top: 20px" >
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block" href="affair.do?action=acceptGood&goodsId=${orderItem.goodsId}&payFlag=${orderItem.payFlag}">确认收货</a></li>
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">申请退货</a></li>
                                        <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系卖家</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </c:forEach>
                </div>



            </div>
        </div>
    </div>

</body>
</html>
