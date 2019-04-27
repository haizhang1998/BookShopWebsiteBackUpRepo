<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/12
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="js/jquery-3.2.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.userInfo==null}">
<c:redirect url="index.jsp"></c:redirect>
</c:if>
<html>
<head>
    <title>店铺信息填写</title>
<c:if test="${sessionScope.userInfo==null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
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

        #nav li {
            padding-top:4px;
        }
        a{
            color: #6c6c6c;
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

        #wrapper-middle{
            border:1px;
            padding-top:100px;
            padding-left:460px;

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

        #top-tag{
            width: 100%;
            height: 80px;
            background-color: #ff4400;
        }

        .tag{
            font-size:35px;
            margin-left: 85px;
            display: inline-block;
            margin-top: 10px;
            color: white;
        }

        .shopImg{
            width:150px;
            height: 150px;
            border: 1px dotted #e5e5e5;
            display: inline-block;
        }
    </style>

    <script type="text/javascript" language="JavaScript">


        function onchangImg() {
            var a=$("#file-id").val();
            alert(a);
            $("#img-id").attr("src",a);
        }

        function submitInfo() {

            var shopname=document.getElementById("reg_shopname");
            var addr=document.getElementById("addr");
            if (shopname.value==""||addr.value==""){
                alert("请完善所有的信息!")
                return false;
            }

return true;

        }

    </script>

</head>
<body background-color>
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


<div id="top-tag">
    <label class="tag">图书商城商家注册</label>
</div>

<div id="wrapper-middle">
 <form action="<%=request.getContextPath()%>/merchant.do?action=regMerchant" method="post" enctype="multipart/form-data">
        <table bgcolor="#fffaf0" cellspacing="8" border="0" style="text-align:left">
            <tr>
                <td><p class="importent">店铺名:</p></td>
                <td><input type="text" id="reg_shopname" name="shopname" class="attribute" value="${reg_shopname}" size="15"></td>
            </tr>
            <tr>
                <td><p class="importent">发货地址:</p></td>
                <td><input type="text" id="addr" name="addr" class="attribute" size="11" ></td>
            </tr>
            <tr>
                <td><p class="importent"  >店铺图标:</p></td>
                <td><input id="file-id" type="file"  name="logo" class="attribute" size="11" value="选择图片"></td>
            </tr>
            <tr>
                <td><p class="importent"></p></td>
                <td><img class="shopImg"   id="img-id"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_reg" class="btn" value="完成注册" /></td>
            </tr>
        </table>
 </form>

</div>
</body>
</html>
