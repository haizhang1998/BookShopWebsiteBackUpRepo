<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $("#nav-head").attr("class","navbar navbar-default navbar-fixed-top");
    });
</script>
<style>

    body {
        font-size: 10pt;
        color: #404040;
        font-family: Arial;
    }

    table {
        font-size: 10pt;
        color: #404040;
        font-family: Arial;
        margin-left: 20px;
        margin-top: 20px;
    }
    #tabpaneSection{
        background: #f40;
        height: 60px;
        margin-top:52px;
    }


    .tabpan-ul{
        list-style: none;
        margin-left: -90px;

    }
    .tabpan-li{
        display: inline-block;
        float: left;
        padding-top: 15px;
        color: white;
        margin-left: 15px;
        height: 60px;
        width: 140px;
        text-align: center;
    }

    a {
        text-decoration: none;
        color: white;
    }
    a:hover {
        text-decoration: none;
        color:antiquewhite;
    }
    a:active{
        text-decoration: none;
        color:antiquewhite;
    }
    a:visited{
        text-decoration: none;
        color:antiquewhite;
    }
    a:link{
        text-decoration: none;
        color:antiquewhite;
    }
    .activeli{
        background: #cc3300;
    }
</style>
<script>
    $(function () {
        $(".tabpan-li").click(function () {
            if(!($(this).attr("class")=="tabpan-li activeli")){
                $("li").removeClass("activeli");
                $(this).addClass("activeli");

            }
        })


    });

    function toVaild(){
        var newPassowrd=document.getElementById("newPassword");
        var ensurePassword=document.getElementById("ensurePassword");
        var oldPassword=document.getElementById("oldPassword");
        if(oldPassword.value!=${sessionScope.userInfo.password}){
            alert("新旧密码不一致！");
            return false;
        }
        // 判断是否和session的password一致
        if(newPassowrd.value!=ensurePassword.value){
            alert("两次密码确认不一致！");
            return false;
        }
    }

</script>
<body>
<section id="navbarSection">
    <nav id="nav-head" class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <li><a href="#">
                    <li>亲，请登录</li>
                    <span class="sr-only">(current)</span></a>
                    </li>

                    <li><a href="#">消息</a></li>
                    <li><a href="#">店铺管理</a></li>
                    <li><a href="#">我要开店</a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">收藏夹</a></li>
                            <li><a href="#">我的足迹</a></li>
                            <li><a href="#">我的订单</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav" style="margin-left: 500px">
                    <li><a href="#"><span>购物车<span class="badge" style="margin-left: 5px">0</span></span></a></li>
                    <li><a href="/jsp/information.jsp">个人中心</a></li>
                    <li><a href="#">注销</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</section>

<section id="tabpaneSection">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <h3 style="color: white;line-height:20px;font-weight:bold;margin-left: -11px; ">个人中心</h3>
            </div>
            <div class="col-md-8">
                <ul class="tabpan-ul">
                    <li class="tabpan-li activeli"><h4><a href="#personalInfo" data-toggle="tab"  class="tabpan-a ">个人基础信息</a></h4></li>
                    <li class="tabpan-li" ><h4><a href="#accountInfo" data-toggle="tab" class="tabpan-a">账号信息</a></h4></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<section id="#tabpaneContent">
    <div class="tab-content" >
        <div role="tabpanel" class="tab-pane active" id="personalInfo" style="margin-top: 80px">
            <sf:form action="/user/revisePersonalInfo" method="post" class="form-horizontal" commandName="userInfo">
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">姓名</label>
                        <div class="col-md-3">
                            <sf:input path="name" type="text" class="form-control"/>
                        </div>
                        <span><sf:errors path="name" cssStyle="color:red"></sf:errors></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">昵称</label>
                        <div class="col-md-3">
                            <sf:input path="nikeName" type="text" name="nikename" class="form-control"/>
                        </div>
                        <span><sf:errors path="nikeName" cssStyle="color:red"></sf:errors></span>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">收货地址</label>
                        <div class="col-md-3">
                            <sf:input path="addr" type="text" name="addr" class="form-control"/>
                        </div>
                        <span><sf:errors path="addr" cssStyle="color:red"></sf:errors></span>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">联系电话</label>
                        <div class="col-md-3">
                            <sf:input path="phone" type="text" name="phone" class="form-control"/>
                        </div>
                        <span><sf:errors path="phone" cssStyle="color:red"></sf:errors></span>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">头像</label>
                        <c:choose>
                        <c:when test="${userInfo.imageLogo!=null}">
                        <img  src="${userInfo.imgDir}" style="float: left;display: inline-block;width: 100px;height: 100px;margin-left: 20px;border: 2px dotted darkgray;padding: 5px">
                        </c:when>
                            <c:otherwise>
                                <img  src="/images/defaultUserLogo.png" style="float: left;display: inline-block;width: 100px;height: 100px;margin-left: 20px;border: 2px dotted darkgray;padding: 5px">
                            </c:otherwise>
                        </c:choose>
                        <input type="file" style="float: left;display: inline-block;" >
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" style="color:white;font-weight: bold;border: none;font-size: 20px"
                           class="col-md-3 col-md-offset-4 btn-success" value="提交修改">
                </div>
            </sf:form>
        </div>
        <div role="tabpanel" class="tab-pane" id="accountInfo" style="margin-top: 80px">
            <form action="/user/revisePersonalInfo" method="post" class="form-horizontal" onsubmit="return toVaild()">
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">原始密码</label>
                        <div class="col-md-3">
                            <input type="text" id="oldPassword" placeholder="输入原始密码" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">新密码</label>
                        <div class="col-md-3">
                            <input type="password" id="newPassword" name="newPassword" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-12">
                        <label class="text-right col-md-2">确认密码</label>
                        <div class="col-md-3">
                            <input type="password" id="ensurePassword" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <input type="submit" style="color:white;font-weight: bold;border: none;font-size: 20px"
                           class="col-md-3 col-md-offset-4 btn-success" value="提交修改">
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
