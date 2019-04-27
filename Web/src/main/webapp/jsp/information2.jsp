<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>海淘购书网</title>
    <link rel="stylesheet" href="css/style4.css" />
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
			<span class="spantitle">修改密码</span>
		</div>
		<div class="contentdiv">
			<form action="user.do?action=modifyPassword" method="post">
			<table>
            <tr>
                <td><p class="importent">原密码:</p></td>
                <td><input type="password" name="ypassword" class="attribute" size="15"></td>
            </tr>
            <tr>
                <td><p class="importent">新密码:</p></td>
                <td><input type="password" size="15" class="attribute" name="xpassword" size="15"></td>
            </tr>
			<tr >
                <td align="center"><p class="importent">确认密码:</p></td>
                <td><input type="password" name="cpassword" class="attribute" size="11" ></td>
            </tr>
            <tr>
                <td colspan="2">
                <input type="submit" name="btn_reg" class="btn"  value="修改密码" />
                </td>
            </tr>
            <tr>
            	<td colspan="3" align="center">
            	<label class="labeltitle">${msg}</label>
            	</td>
            </tr>
        </table>
		</form>
		</div>
	</div>
</body>
</html>
