<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/3/30
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="用户名" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="static/css/login.css">
<head>
    <title>登录界面</title>
</head>

<script language="JavaScript">

    function oncheck(){

        var u= document.getElementById("username");
        var p=document.getElementById("password");
        if(u.value=="手机/邮箱/会员名"||p.value==""){
            alert("账号名及密码不能为空！");
            return false;
        }
        return true;
    }


</script>
<body>
<%--<c:if test="${param.js!=null}">--%>
<%--    <script>alert("注销成功！");</script>--%>
<%--</c:if>--%>
<p id="mentionP"> 为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！</p>
<div id="loginDiv">
    <h1 style="color: black">会员登录界面</h1>
    <!--如果登录失败，则打印失败信息-->
    <c:if test="${state!=null}">
        <p style="color: red"><em style="font-size: 18px;font-style: normal">
                ${state}
        </em></p>
    </c:if>




    <sf:form action="user/login" method="post"  onsubmit="return oncheck()">

<%--        <sf:errors path="*" element="div" cssClass="errors"></sf:errors>--%>
        <table border="0" style="text-align:center">
            <tr>
                <td>>用户名:</td>
                <td><input type="text"  class="input1" name="username" placeholder="手机/邮箱/会员名"   size="15"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input type="password" class="input1" size="15" name="password" ></td>
            </tr>
            <tr>

                <td colspan="2" align="right"><input type="checkbox" name="autoLogin" value="autoLogin">自动登陆</td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" name="btn_longin"  class="btn" value="登录"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="button" class="btn" onclick="window.location.href='regist.jsp'" name="btn_reg" value="注册用户" />
                </td>
            </tr>

        </table>

    </sf:form>
</div>

</body>
</html>
