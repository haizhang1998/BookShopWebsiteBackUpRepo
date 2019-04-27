<%@ page import="com.haizhang.bean.UserInfo" %><%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/14
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销用户</title>
</head>
<body>
<%
    UserInfo info =(UserInfo)session.getAttribute("userInfo");
    String id=info.getUsername();
    System.out.println(id+"注销成功！");
    session.invalidate();
    response.sendRedirect("index.jsp?js='logout'");
%>
</body>
</html>
