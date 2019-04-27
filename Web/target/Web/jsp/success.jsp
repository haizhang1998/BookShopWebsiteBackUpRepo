<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/3/30
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../static/css/common.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Welcome!
    <c:if test="${sessionScope.userInfo !=null}">
        <c:out value="${sessionScope.userInfo.name}"></c:out>成功登录
    </c:if>

</h1>

</body>
</html>
