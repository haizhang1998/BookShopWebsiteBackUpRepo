<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/23
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/regist.css'/>">

    <script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/regist.js'/>"></script>
</head>
<body>
<div id="divMain">
    <div id="divTitle">
        <span id="spanTitle">个人信息</span>
    </div>
    <div id="divBody">
        <form action="/user.do?action=modify" method="post">
        <table id="tableForm">
            <tr>
                <td class="tdText">昵称：</td>
                <td class="tdInput">
                    <input class="inputClass" type="text" name="name" id="loginname" value="<%=request.getAttribute("name")%>"/>
                </td>
            </tr>
            <tr>
                <td class="tdText">手机：</td>
                <td>
                    <input class="inputClass" type="text" name="phone" id="loginpass" value="<%=request.getAttribute("phone")%>"/>
                </td>
            </tr>
            <tr>
                <td class="tdText">收货地址：</td>
                <td>
                    <input class="inputClass" type="text" name="address" id="reloginpass" value="<%=request.getAttribute("address")%>"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <input type="submit" value="保存修改" id="submitBtn"/>
                </td>
            </tr>
        </table>
        </form>
    </div>
</div>
</body>
</html>
