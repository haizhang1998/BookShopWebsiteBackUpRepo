<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/4/3
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>出错界面</title>
</head>
<body>
<h1 style="color: red">出错啦！
<c:out value="${param.state}"></c:out>
</h1>
</body>
</html>
