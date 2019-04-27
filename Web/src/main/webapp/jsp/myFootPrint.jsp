<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/3
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-3.2.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"  type="text/css" href="css/myFootPrint.css">
<html>
<c:if test="${sessionScope.userInfo==null}">
     <c:redirect url="index.jsp"></c:redirect>
</c:if>
<head>
    <title>我的足迹</title>
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

<div id="wrapper-middle" >
    <div id="search-div">
        <a href="cart.jsp" >
            <p style="float:left;display:inline-block;line-height: 80px; vertical-align:10%; font-size:24px; color: white;font-weight: bold" ><span>我的足迹</span></p>
        </a>
    </div>

</div>

<div id="lastWrapper">
    <div id="tabDiv">
        <ul>
            <li><a href="shoppingInterface.jsp">浏览记录</a></li>
        </ul>
    </div>

    <div id="itemListDiv">

        <ul id="itemListDiv-ul">
        <c:forEach var="item" items="${sessionScope.footPrintList.footPrintList}"  >
            <p class="date-p">${item.key}</p>

            <c:forEach var="itemvalue" items="${item.value}">
                <li>
                    <a href="affair.do?action=getFootPrint&goodsId=">
                        <img class="itemImage" src=${itemvalue.imgDir}>
                        <p class="p1">
                          ${itemvalue.goodsName}
                        </p>
                        <p class="p2">
                        ￥${itemvalue.price}
                        </p>
                      </a>
                 </li>
        </c:forEach>

        </c:forEach>
        </ul>
    </div>

</div>

</body>
</html>
