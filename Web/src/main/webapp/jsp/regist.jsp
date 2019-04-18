<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/6
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会员注册</title>
</head>
<style type="text/css">
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
    body{
        background: cornsilk;
        padding-left:5px;
        padding-top:5px;
        font-family: 微软雅黑;
    }
    #regDiv{
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .importent{
        font-weight: bold;
        color: red;
        display: inline;
    }

</style>

<script type="text/javascript" language="JavaScript">
    function onCheck() {

        var username=document.getElementById("reg_username");
        var phone=document.getElementById("phone");
        var password=document.getElementById("reg_password");
        var addr=document.getElementById("addr");
        var name=document.getElementById("name");
        if (name.value==""||username.value==""||password.value==""||addr.value==""||phone==""){
            alert("请完善所有的信息!")
            return false;
        }
             return true;
    }
</script>
<body>
<div id="nav">
    <input type="button" name="loginBtn" value="点击返回登录界面" class="btn" onclick="window.location.href='/jsp/login.jsp'"/>
</div>

<div id="regDiv">
    <c:if test="${state!=null}">
        <p style="color: red;font-size: 18px" ><span>${state}</span></p>
    </c:if>
    <h1>会员注册界面</h1>
    <form action="user/regist" method="post" onsubmit="return onCheck()">
        <table bgcolor="#fffaf0" cellspacing="8" border="0" style="text-align:left">
            <tr>
                <td><p class="importent"><span>*</span></p>注册用户名:</td>
                <td><input type="text" name="regUsername" id="reg_username" value="${regUsername}" size="15"></td>
            </tr>
            <tr>
                <td><p class="importent"><span>*</span></p>注册密码:</td>
                <td><input type="password" size="15" id="reg_password" name="regPassword" value="${regPassword}" size="15"></td>
            </tr>
            <tr >
                <td align="center">姓名:</td>
                <td><input type="text" name="name"id="name" size="5" ></td>
            </tr>

            <tr >
                <td align="center"><p class="importent"><span>*</span></p>手机:</td>
                <td><input type="text" name="phone" id="phone" size="11" ></td>
            </tr>
            <tr>
                <td><p class="importent"><span>*</span></p>收件地址:</td>
                <td><input type="text" name="addr" id="addr" size="11" ></td>
            </tr>
            <tr>
                <td>昵称:</td>
                <td><input type="text" name="nikeName" id="nikeName" size="11" ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_reg" class="btn"  value="完成注册" /></td>
            </tr>
        </table>

    </form>
</div>
</body>
</html>
