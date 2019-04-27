<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/22
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<link rel="stylesheet" type="text/css"href="/css/style3.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/pwd.css'/>">
<script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>
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
    body {
        font-size: 10pt;
        color: #404040;
        font-family: Arial;
    }

    .div0 {
        margin: 20px 80px;
        font-size: 15px;
    }

    .div1 {
        width: 820px;
        margin-left: 80px;
        margin-top: 30px;
        margin-bottom: 0px;
        font-size: 12px;
        border: 1px solid #D2D3D5;
        background-color: #F4FEFF;
    }

    table {
        font-size: 10pt;
        color: #404040;
        font-family: Arial;
        margin-left: 20px;
        margin-top: 20px;
    }

    .input {
        border: 1px solid #DADADA;
        height: 20px;
        margin-left: 15px;
    }

    .bc {
        width: 80px;
        height: 20px;
        margin-left: 15px;
    }

    #vCode {
        margin-left: 15px;
    }

    #verifyCode {
        width: 50px;
    }

    label.error {
        color: #cc3300;
    }

    a {text-decoration: none; color: #018BD3;}
    a:visited {color: #018BD3;}
    a:hover {color:#FF6600; text-decoration: underline;}
</style>
<body>
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
        <h1>修改密码</h1>
    </div>
    <div class="header-nav">
        <a href="user.do?action=Init">昵称</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="user.do?action=Init">收货地址</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="user.do?action=Init">更换手机</a>
    </div>
</div>

<div class="div1">
    <form action="user.do?action=modifyPassword" method="post" target="_top">
        <input type="hidden" name="method" value=""/>
        <table>
            <tr>
                <td><label class="error">${msg }</label></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td align="right">原密码:</td>
                <td><input class="input" type="password" name="loginpass" id="loginpass" value=""/></td>
                <td><label id="loginpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right">新密码:</td>
                <td><input class="input" type="password" name="newpass" id="newpass" value=""/></td>
                <td><label id="newpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right">确认密码:</td>
                <td><input class="input" type="password" name="reloginpass" id="reloginpass" value=""/></td>
                <td><label id="reloginpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right"></td>
                <td><input id="submit" type="submit" value="修改密码"/></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
