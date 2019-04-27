<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>海淘购书网</title>
    <link rel="stylesheet" href="css/style4.css" />
</head>
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
            <li class="li2" ><a href="logout.jsp" style="color: red;font-weight: bold">点我注销</a></li>


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
                <h1>个人中心</h1>
            </div>
            <div class="header-nav">
                <a href="user.do?action=Init">昵称</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="user.do?action=Init">收货地址</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="user.do?action=Init">更换手机</a>
           </div>
    </div>

	<div class="maindiv">
		<div class="topdiv">
			<span class="spantitle">个人资料</span>
		</div>
		<div class="contentdiv">
			<form action="user.do?action=modify" method="post">
			<table>
                <tr>
                    <td><p class="importent">昵称:</p></td>
                    <td><input type="text" name="nikename" class="attribute" size="15" value="${nikename}"/></td>
                </tr>
                <tr>
                    <td><p class="importent">手机号:</p></td>
                    <td><input type="text" size="15" class="attribute" name="phone" size="15" value="${phone}" /></td>
                </tr>
                <tr >
                    <td align="center"><p class="importent">收货地址:</p></td>
                    <td><input type="text" name="address" class="attribute" size="11" value="${address}"/></td>
                </tr>
            <tr>
                <td colspan="2">
                <input type="submit" name="btn_reg" class="btn"  value="提交修改" />
                </td>
            </tr>
                <tr>
                    <td colspan="3" align="center">
                        <label class="labeltitle">${message}</label>
                    </td>
                </tr>
        </table>
		</form>
		</div>
	</div>
</body>
</html>