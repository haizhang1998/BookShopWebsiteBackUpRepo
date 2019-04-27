<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/10
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>海淘购书网</title>
    <link rel="stylesheet" href="css/bookByField.css"/>
    <script src="js/scrollPane.js"></script>
    <script src="js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/scrollPane.css">
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
    function goSearch(){
        var address="good.do"
        if($("#searchGoodsText").val()=="请输入关键字") {
            location.href ="#";
        }
        else{
            var search=$("#searchGoodsText").val();
            var require=$("#require").val();
            location.href = address+"?search="+search+"&require="+require+"&action=queryGoods";
        }
    }
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

    <div class="header-order">
            <div class="header-logo">
                <h1>分类检索</h1>
            </div>
            <div class="header-nav">
                <a href="">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">账户设置</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="">消息</a>
            </div>
    </div>

<div id="wrapper-middle">
    <div id="search-div">
        <div id="lookupDivWrapper" style="width:800px">
            <select name="require" id="require" style="float: left" >
                <option value="shoppingName" selected>书籍名称</option>
                <option value="shoppingFeild">书籍类别</option>
                <option value="merchantShop">卖家店铺</option>
            </select>
            <input type="text" placeholder="请输入关键字"  style="float: left" size="60" id="searchGoodsText" maxlength="80"/>
            <input type="button" value="搜索" style=" margin-left:0px;margin-top:0px;border-radius:0%;cursor: pointer;" onclick="goSearch()" id="searchBtn"/>
        </div>
    </div>
</div>

<div id="newBookShowWrapper">
    <div id="newBookShowDiv" style="overflow: hidden">
        <ul style="" class="newBookShowDiv-ul">
            <c:forEach items="${requestScope.goods}" var="newGood">
            <li>
                <a href="affair.do?goodsId=${newGood.goodsId}&action=getGoodById">
                    <img src=${newGood.imgDir}>
                    <p class="p1">
                            ${newGood.goodsName}
                    </p >
                    <p class="p2">
                        ￥${newGood.price}
                    </p >
                </a>
            </li>
        </c:forEach>

            <c:forEach items="${requestScope.shopList}" var="shop">
                <li>
                    <a href="affair.do?merchantId=${shop.merchantId}&action=getshopById">
                        <img src=${shop.shopLogo}>
                        <p class="p1">
                                ${shop.shopName}
                        </p >
                        <p class="p2">
                            ￥${shop.addr}
                        </p >
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div >
</div>
</body>
</html>
