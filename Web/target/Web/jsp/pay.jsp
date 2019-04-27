<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/12
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>结算画面</title>
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
*{
padding:0;
margin:0;
}
#nav{

overflow: auto;
zoom:1;
margin:0 auto;
width: 1100px;
}
#wrapper-top{

width:100%;
background: #f5f5f5;

}
#nav ul {
float: left;
background: #f5f5f5;
width:1000px;
list-style: none;
height:30px;

}
.li1{
font: 13px 微软雅黑 ;
float: left;
text-align: center;

}

.li2{
font: 13px 微软雅黑 ;
float:right;
text-align: center;


}
a{
text-decoration: none;
cursor: pointer;
}

#nav ul li a:hover{
display:inline-block;
color:#ff4400;
background: white;
}


li:after{
content:"";
display: inline-block;
margin-right: 25px;
}
#nav li{
color:#6c6c6c;
padding-top:4px;
cursor: pointer;

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
<c:if test="${sessionScope.userInfo==null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
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
    <div style="float: left;height: 200px;width: 900px;overflow: auto;margin-left:200px">

        <c:out value="订单提交成，请等待商家发货"></c:out>

        <c:if test="${sessionScope.payOperate=='立即缴费'}">
       <h1 style="display: inline-block">成功缴费：<p style="display: inline-block;margin-left:150px;color: #ff4400"><span>${param.payMoney}元</span></p></h1>
        </c:if>

     <input style="display:block;margin-top: 30px" onclick="window.location.href='shoppingInterface.jsp'" class="btn"  type="button" id="clickBack" value="点我继续购物">
    </div>
</body>
</html>
