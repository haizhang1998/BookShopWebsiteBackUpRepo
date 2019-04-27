<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/24
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/homePage.css">

<c:if test="${sessionScope.userInfo==null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
<c:if test="${sessionScope.userInfo.merchantFlag==1}">
    alert("请先注册成为卖家");
    <c:redirect url="openShop.jsp"></c:redirect>
</c:if>
<c:if test="${regFlag==true}">
    <script>alert("开店成功！")</script>
</c:if>
<html>
<head>
    <title>价位调整</title>
</head>
<style>
    #top-tag{
        width: 100%;
        height: 60px;
        background-color: #ff4400;
    }

    .tag{
        font-size:25px;
        margin-left: 85px;
        display: inline-block;
        margin-top: 10px;
        color: white;
    }
#managePriceDiv{
    margin-left: 400px;
    margin-top: 100px;

}
    .importent {
        height:40px;
        width:120px;
        font-size:20px;
        line-height: 40px;
        text-align: left;
    }
    .attribute{
        height:40px;
        width:400px;
        font-size:20px;
        line-height: 40px;
    }
    .btn{
        width: 300px;
        height: 42px;
        border-radius: 3px;
        border: 0;
        color: #fff;
        display: inline-block;
        overflow: hidden;
        cursor: pointer;
        zoom: 1;
        font-size: 20px;
        font-weight: bold;
        background: #f40;
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

            <li class="li1"> <a href="information2.jsp" >个人中心</a></li>
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
<div id="top-tag">
    <label class="tag">调整物品价格</label>
</div>
<div id="managePriceDiv">
        <form action="<%=request.getContextPath()%>/merchant.do?action=managePrice" method="post" enctype="multipart/form-data">
            <table bgcolor="#fffaf0" cellspacing="8" border="0" style="text-align:left;">
                <tr>
                    <td><p class="importent">商品名:</p></td>
                    <td><input type="text" id="reg_shopname" name="shopname" class="attribute" value="${reg_shopname}" size="15"></td>
                </tr>
                <tr>
                    <td><p class="importent">新价格:</p></td>
                    <td><input type="text" id="newPrice" name="newPrice" class="attribute" size="11" ></td>
                </tr>

                <tr>
                    <td><p class="importent"></p></td>
                    <td><img class="shopImg"   id="img-id"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_reg" class="btn" value="提交" /></td>
                </tr>
            </table>
        </form>
</div>
</body>
</html>
