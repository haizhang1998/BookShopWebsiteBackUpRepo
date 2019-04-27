<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/6
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
        margin-top: 10px;
    }
    .input1{
        width: 240px;
        font-size: 14px;
        line-height: 18px;
        height: 30px;
        padding-left:5px;
        border: 1px solid #ddd;
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
        font-size:20px;

    }
.label-font{
    font-size: 20px;
}
    .row{
        margin-top: 10px;
    }

    .error-font{
        color: red;
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

</div>

<div id="regDiv">
    <c:if test="${state!=null}">
        <p style="color: red;font-size: 18px" ><span>${state}</span></p>
    </c:if>

    <h1 class="text-center">会员注册界面</h1>

    <div class="container">
        <sf:form class="form-horizontal" action="/user/regist" commandName="userInfo" method="post" onsubmit="return onCheck()">
               <span  class="importent">*</span><span class="label-font">注册用户名:</span>
                    <sf:input type="text" path="username" cssClass="input1" id="reg_username"  size="15"/><span><sf:errors path="username" cssClass="error-font"></sf:errors></span></td>
               </div>
            <div class="row">
                <span  class="importent">*</span><span class=" label-font">注册密码:</span>
                <sf:input type="password"  id="reg_password" cssClass="input1" path="password" size="15"/><span><sf:errors path="password" cssClass="error-font"></sf:errors></span></td>
            </div>

            <div class="row">
                <span class="label-font">姓名</span>
                <sf:input type="text" path="name"  cssClass="input1" id="name" size="15" />
            </div>

            <div class="row">
                <span  class="importent">*</span><span class="label-font">手机:</span>
                <sf:input type="text" path="phone" cssClass="input1" id="phone" size="11" /><span><sf:errors path="phone" cssClass="error-font"></sf:errors></span>
            </div>

            <div class="row">
                <span  class="importent">*</span><span class="label-font">收件地址:</span>
                <sf:input type="text" path="addr" id="addr" cssClass="input1" size="11" /><span><sf:errors path="addr" cssClass="error-font"></sf:errors></span>
            </div>

            <div class="row">
                <span class="label-font">昵称:</span>
                <sf:input type="text" path="nikeName" id="nikeName" size="11" /><span><sf:errors path="nikeName" cssClass="error-font"></sf:errors></span>
            </div>

            <div class="row">
                <input type="submit" name="btn_reg" class="btn"  value="完成注册" />
             </div>
            <input type="button" name="loginBtn" value="点击返回登录界面" class="btn" onclick="window.location.href='/jsp/login.jsp'"/>

</sf:form>
    </div>
</div>
</body>
</html>
