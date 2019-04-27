<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/10
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购书网首页</title>
    <script src="js/scrollPane.js"></script>
    <script src="js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/homePage.css">
    <!--<script src="js/homePage.js"></script>-->
    <link rel="stylesheet" type="text/css" href="css/scrollPane.css">
</head>
<script>
    function goSearch(){
        var address="good.do"
        if($("#searchGoodsText").val()=="请输入关键字") {
            location.href ="#";
        }
        else{
            var search=$("#searchGoodsText").val();
            var require=$("#require").val();
            location.href = address+"?search="+search+"&require="+require+"&action=queryGoods";
        }
    }


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
        $("#itemListDiv .outsideDiv").mousemove(function () {
            $(this).css("border","1px solid #f40");
        })
        $("#itemListDiv .outsideDiv").mouseout(function () {
            $(this).css("border","1px solid #ededed");
        })
        $("#lookupLogo-ul").mouseover(function () {
            $("#lookupLogoDiv").css("overflow","visible");
        });
        $("#lookupLogo-ul").mouseout(function () {
            $("#lookupLogoDiv").css("overflow","hidden")
        });
        $("#lookupLogo-ul li").click(function () {
            if($(this).prev()) {
                if($(this).attr("name")=="baobei"){
                    address="baobei.jsp"
                }
                else {
                    address="dianpu.jsp"
                }
                $(this).after($(this).prev());
            }

        });

    });

</script>

<body>
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

            <li class="li1"> <a href="information2.jsp" >个人中心</a></li>
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


<div id="wrapper-middle">
    <div id="search-div">
        <div id="lookupDivWrapper" style="width:800px">
            <select name="require" id="require" style="float: left" >
                <option value="shoppingName" selected>书籍名称</option>
                <option value="shoppingFeild">书籍类别</option>
                <option value="merchantShop">卖家店铺</option>
            </select>
            <input type="text" placeholder="请输入关键字"  style="float: left" size="60" id="searchGoodsText" maxlength="80"/>
            <input type="button" value="搜索" style=" margin-left:0px;margin-top:0px;border-radius:0%;cursor: pointer;" onclick="goSearch()" id="searchBtn"/>
        </div>
    </div>
</div>

<div id="scrollPaneWarp">
    <div id="fieldWrap" >
        <ul>
            <li class="bookField" style="color: whitesmoke;list-style:none; font-weight: bold; font-size: 18px">书籍分类&nbsp;&nbsp;:</li>
            <li class="bookField"><a href="good.do?search=小说&require=shoppingFeild&action=queryGoods">小说&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=文学&require=shoppingFeild&action=queryGoods">文学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=科学技术&require=shoppingFeild&action=queryGoods">科学技术&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=儿童书籍&require=shoppingFeild&action=queryGoods">儿童书籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=家庭养生&require=shoppingFeild&action=queryGoods">家庭养生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=军事历史&require=shoppingFeild&action=queryGoods">军事历史&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            <li class="bookField"><a href="good.do?search=艺术设计&require=shoppingFeild&action=queryGoods">艺术设计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
        </ul>
    </div>
    <div id="imgWarp" >
        <a href="affair.do?goodsId=112&action=getGoodById"><img id="img1" src="images/轮播/1.jpg"  TITLE="img1" /></a>
        <a href="affair.do?goodsId=113&action=getGoodById"><img id="img2" src="images/轮播/2.jpg" TITLE="img2"/></a>
        <a href="affair.do?goodsId=114&action=getGoodById"><img id="img3" src="images/轮播/3.jpg" TITLE="img3"/></a>
        <a href="affair.do?goodsId=115&action=getGoodById"><img id="img4" src="images/轮播/4.jpg" TITLE="img4"/></a>
        <a href="affair.do?goodsId=116&action=getGoodById"><img id="img5" src="images/轮播/5.jpg" TITLE="img5" /></a>
    </div>
    <span class="btn" id="left" style="margin-left: 200px;z-index: 11;"><</span>
    <span class="btn" id="right" style="margin-right: 10px;z-index: 11">></span>
    <div class="links">
        <em class="active"></em>
        <em></em>
        <em></em>
        <em></em>
        <em></em>
    </div>
</div>

<div id="newBookShowWrapper">
    <p style="display: inline-block;font-size: 20px;margin-left: 54px"><span style="font-weight:bold">新书上架</span></p >
    <div id="newBookShowDiv" style="overflow: hidden">

        <ul style="" class="newBookShowDiv-ul">
            <c:forEach items="${sessionScope.newGoodList.newGoodList}" var="newGood">
                <li>
                    <a href="affair.do?goodsId=${newGood.goodsId}&action=getGoodById">
                    <img src=${newGood.imgDir}>
                    <p class="p1">
                            ${newGood.goodsName}
                    </p >
                    <p class="p2">
                        ￥${newGood.price}
                    </p >
                </a>
                </li>
            </c:forEach>
        </ul>
    </div >
</div>

    <div id="BookRecommendDiv" >
        <div class="div1" style="width:900px;">
       <p class="p3" style="margin-left: 50px;font-weight: bold;color: black;font-size:20px ">
           好书推荐
       </p>
        <ul id="BookRecommendDiv-ul">
            <c:forEach items="${sessionScope.newGoodList.newGoodList}" var="good" begin="0" end="8" step="1">
            <li>

                <a href="affair.do?goodsId=${good.goodsId}&action=getGoodById">
                <img src="${good.imgDir}"/>
                    <p class="p1">
                      ${good.goodsName}
                    </p>
                    <p class="p2">
                        ￥${good.price}
                    </p>
                </a>
            </li>
            </c:forEach>
        </ul>
        </div>

        <div class="div2"  style="overflow: hidden;width: 250px; height:590px">
            <p class="p4" style="margin-bottom: 0px;font-weight: bold;color: black;font-size:20px ">
                热销排行
            </p>
            <ul >
                <c:set var="step" value="0" scope="page"/>
                <c:forEach var="hotGood" items="${sessionScope.hotGoodList.hotGoodList}">
                    <c:set var="step" value="${pageScope.step+1}"/>
                    <li>
                        <c:choose>
                        <c:when test="${pageScope.step==1}">
                            <font style="color: red;font-weight: bold"><c:out value="${pageScope.step}"></c:out></font>
                    &nbsp;&nbsp;&nbsp;<a  style="color:red;font-weight: bold" href="affair.do?goodsId=${hotGood.goodsId}&action=getGoodById">${hotGood.goodsName}</a></li>
                        </c:when>
                            <c:when test="${pageScope.step==2}">
                                <font style="color: silver;font-weight: bold"> <c:out value="${pageScope.step}"></c:out></font>
                                &nbsp;&nbsp;&nbsp;<a style="color: silver; font-weight: bold" href="affair.do?goodsId=${hotGood.goodsId}&action=getGoodById">${hotGood.goodsName}</a></li>
                            </c:when>
                            <c:when test="${pageScope.step==3}">
                                <font style="color: goldenrod;;font-weight: bold"><c:out value="${pageScope.step}"></c:out></font>
                                &nbsp;&nbsp;&nbsp;<a style="color: goldenrod; font-weight: bold" href="affair.do?goodsId=${hotGood.goodsId}&action=getGoodById">${hotGood.goodsName}</a></li>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${pageScope.step}"></c:out>
                                &nbsp;&nbsp;&nbsp;<a href="affair.do?goodsId=${hotGood.goodsId}&action=getGoodById">${hotGood.goodsName}</a></li>
                            </c:otherwise>
                        </c:choose>

                </c:forEach>

            </ul>
        </div>
    </div>

</body>
</html>
