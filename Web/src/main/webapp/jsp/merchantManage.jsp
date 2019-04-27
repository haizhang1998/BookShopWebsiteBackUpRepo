<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/12/20
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>卖家管理</title>
</head>
<link rel="stylesheet"  type="text/css" href="css/myFootPrint.css">
<script src="js/jquery-3.2.1.js"></script>
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

        <c:if test="${sessionScope.userInfo==null}">
             <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.userInfo.merchantFlag==1}">
        alert("请先注册成为卖家");
        <c:redirect url="openShop.jsp"></c:redirect>
        </c:if>

        <c:choose>
        <c:when test="${param.operateType=='upGoods'}">
         <c:if test="${param.flag==true}">
                alert("上架成功！")
         </c:if>
         $("#a1").attr("class","a123Active");
        $("#a1_divWrapper").css("display","block");
        $("#a2_divWrapper").css("display"," none");
        $("#a3_divWrapper").css("display"," none");
        </c:when>

        <c:when test="${param.operateType=='manageShop'}">
        $("#a2").attr("class","a123Active");
        $("#a1_divWrapper").css("display","none");
        $("#a2_divWrapper").css("display","block");
        $("#a3_divWrapper").css("display"," none");
        </c:when>

        <c:when test="${param.operateType=='manageOrder'}">
        $("#a3").attr("class","a123Active");
        $("#a1_divWrapper").css("display","noe");
        $("#a2_divWrapper").css("display"," none");
        $("#a3_divWrapper").css("display","block");
        </c:when>

        <c:otherwise>
        $("#a1").attr("class","a123Active");
        $("#a1_divWrapper").css("display","block");
        $("#a2_divWrapper").css("display"," none");
        $("#a3_divWrapper").css("display"," none");
        </c:otherwise>
        </c:choose>

    $("#a1").click(function () {
        if($(this).attr("class")=="a123noActive"){
            $("#a2").attr("class","a123noActive");
            $("#a3").attr("class","a123noActive");
            $(this).attr("class","a123Active");
            $("#a1_divWrapper").css("display","block");
            $("#a2_divWrapper").css("display"," none");
            $("#a3_divWrapper").css("display"," none");

        }

    });

        $("#a2").click(function () {
            if($(this).attr("class")=="a123noActive"){
                $("#a1").attr("class","a123noActive");
                $("#a3").attr("class","a123noActive");
                $(this).attr("class","a123Active");
                $("#a2_divWrapper").css("display","block");
                $("#a1_divWrapper").css("display"," none");
                $("#a3_divWrapper").css("display"," none");
            }

        });

        $("#a3").click(function () {
            if($(this).attr("class")=="a123noActive"){
                $("#a2").attr("class","a123noActive");
                $("#a1").attr("class","a123noActive");
                $(this).attr("class","a123Active");
                $("#a3_divWrapper").css("display","block");
                $("#a2_divWrapper").css("display"," none");
                $("#a1_divWrapper").css("display"," none");
            }

        });


    });
</script>
<style>
    #middle-div{
        width: 100%;
        background: #f40;
        color: white;
        height:60px;

    }
    .middle-wrapper-ul{
        height: 60px;
        width:600px;
        display: inline-block;
        float: left;
        margin-left:90px;
    }
    .middle-wrapper-ul li{
        list-style: none;
        font-size:20px;
        float: left;
        display: inline-block;
        color:white;

    }
    #a1{
        display: inline-block;
        float: left;
        color: white;
        height:50px;
        width:130px;
        text-align: center;
        padding-top: 10px;

    }
    #a2{
        float: left;
        color: white;
        display: inline-block;
        height:50px;
        width:130px;
        text-align: center;
        padding-top: 10px;

    }
    #a3{
        float: left;
        color: white;
        display: inline-block;
        height:50px;
        width:130px;
        text-align: center;
        padding-top: 10px;

    }

   .a123Active{
    font-weight: bold;
    background:#de3b00;
    }
    .a123noActive{

    }

   #a1_divWrapper{
       height: 800px;
       display: none;
   }

    #a2_divWrapper{

        display: none;
    }
    #a3_divWrapper{

        display: none;
        margin-bottom: 100px;
    }


    #div1{
       background:#fffaf0;
       padding-left:300px;
        padding-top: 30px;

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
    .shopImg{
        width:150px;
        height: 150px;
        border: 1px dotted #e5e5e5;
        display: inline-block;
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
    .option_cls{
        font-size:14px;
    }
    .select_cls{
        font-size: 14px;
        background: whitesmoke;
        width: 120px;
        height: 23px;
    }

    #div3-ul1 {
        margin-top:30px;
        list-style: none;
        width:1230px;
        margin-left: 20px;
        height: 34px;
        background: #e5e5e5;

    }
    #div3-ul1 li{
        float: left;
        margin-top:5px;
        margin-left: 20px;
        font-size: 16px;
        font-weight: bold;
        color:black;

    }
    .div3-sonDiv{
        margin-left: 20px;
    }
    .div3-sonDiv-ul{
        list-style: none;
        margin-top: 5px;
        background: whitesmoke;
        height: 121px;
        width:1230px;
        border: 1px solid whitesmoke;
    }

    .div3-sonDiv-ul li{
        float:left;
        margin-left:20px;
        height: 120px;
    }

    .goodsImg{
        width: 120px;
        height: 120px;
        display: inline-block;
        float: left;
    }
    .operate-ul{
        float: left;
        list-style: none;
    }
    .operate-li a:hover{
        color: #f40;
    }
     #shop_logoDiv{
         height: 100px;
         margin-left: 80px;
         margin-top: 20px;

     }
    #shop_logoDiv_son1{
        width: 1030px;
        height: 100px;
        border-bottom: 2px solid #f40;

    }
    #shop_logoDiv_son1 img{
        width:100px;
        height:100px;
        display: inline-block;
        float: left;
    }
    #shop_logoDiv_ul{
        list-style: none;
        overflow: hidden;
        height:100px;

    }
    .shop_logoDiv_shopName{
        font-weight: bold;
        color: #000;
        font-size:23px;
        margin-top:10px;
        margin-left: 25px;
    }
    .shop_logoDiv_shopAddr{
        font-weight: bold;
        color: #000;
        font-size:18px;
        margin-top: 20px;
        margin-left: 25px;
    }
    #shopGoodsDiv{
        width: 1100px;
        margin-top: 20px;
        margin-left: 80px;
    }
    #shopGoodsUl{
        width: 1060px;
        list-style: none;
    }
     .shopGoodsLi{
         width: 180px;
         height: 280px;
         border: 1px solid #e5e5e5;
         float: left;
         margin-left: 20px;
         overflow: hidden;
         margin-top: 10px;
     }

    .shopGoods_btn1{
        color:white;
        float: left;
        display: inline-block;
        background:#f40;
        font-size:14px;
        width:70px;
        text-align: center;
        height: 20px;
        padding:5px;
    }
</style>
<body>
<!-- 导航栏div -->
<div id="wrapper-top">
    <div id="nav" >
        <ul style="overflow: visible" >
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

<div id="middle-div">
    <p style="font-size: 20px;display:inline-block;margin-top: 10px;margin-left:80px;font-weight: bold;float: left">卖家管理界面</p>
    <ul class="middle-wrapper-ul">
        <li><a id="a1" class="a123noActive" >上架货物</a></li>
        <li><a id="a2" class="a123noActive" href="merchant.do?action=getAllShopGoods&operateType=manageShop" >管理店铺</a></li>
        <li><a id="a3" class="a123noActive" href="merchant.do?action=getAllMerchantOrders&operateType=manageOrder">管理订单</a></li>
    </ul>
</div>

<!--                                上架商品                     -->
<div id="a1_divWrapper">
    <p style="font-size: 25px;margin-top: 15px;margin-left: 80px;font-weight: bold;">上架商品</p>
    <div id="div1">

        <form action="<%=request.getContextPath()%>/merchant.do?action=upGoods&operateType=upGoods" method="post" enctype="multipart/form-data">
            <table  cellspacing="8" border="0" style="text-align:left">
                <tr>
                    <td><p class="importent">商品名字:</p></td>
                    <td><input type="text" id="goodsName" name="goodsName" class="attribute" value="${reg_shopname}" size="15"></td>
                </tr>
                <tr>
                    <td><p class="importent">商品描述:</p></td>
                    <td><input type="text" id="detail" name="detail" class="attribute" value="${reg_shopname}" size="15"></td>
                </tr>
                <tr>
                    <td><p class="importent">发货地址:</p></td>
                    <td><input type="text" id="addr" name="addr" class="attribute" value="${reg_shopname}" size="15"></td>
                </tr>
                <tr>
                    <td><p class="importent">商品总数:</p></td>
                    <td><input type="text" id="remainNumber" name="remainNumber" class="attribute" value="${reg_shopname}" size="15"></td>
                </tr>
                <tr>
                    <td><p class="importent">商品分类:</p></td>
                    <td>
                    <select class="select_cls" name="type">
                        <option class="option_cls" value="科学技术">科学技术</option>
                        <option class="option_cls"value="小说">小说</option>
                        <option class="option_cls" value="文学">文学</option>
                        <option class="option_cls" value="儿童书籍">儿童书籍</option>
                        <option class="option_cls" value="家庭养生">家庭养生</option>
                        <option class="option_cls" value="军事历史">军事历史</option>
                        <option class="option_cls" value="艺术设计">艺术设计</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td><p class="importent">商品价钱:</p></td>
                    <td><input type="text" id="price" name="price" class="attribute" size="11" ></td>
                </tr>
                <tr>
                    <td><p class="importent">商品图标:</p></td>
                    <td><input id="file-id" type="file"  name="logo" class="attribute" size="11" value="选择图片"></td>
                </tr>
                <tr>
                    <td><p class="importent"></p></td>
                    <td><img class="shopImg" id="img-id"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="upGoodsBtn" class="btn" value="上架商品" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<!-- 商铺管理 -->
<div id="a2_divWrapper" >
    <div id="shop_logoDiv">
        <div id="shop_logoDiv_son1">
            <img src="${sessionScope.merchantShop.shopLogo}">
            <ul id="shop_logoDiv_ul">
                <li class="shop_logoDiv_shopName">${sessionScope.merchantShop.shopName}</li>
                <li class="shop_logoDiv_shopAddr">${sessionScope.merchantShop.addr}</li>
            </ul>
            </div>
    </div>
    <div id="shopGoodsWrapper" >
        <div id="shopGoodsDiv">
            <ul id="shopGoodsUl">

                <c:forEach var="shopItem" items="${sessionScope.merchantShop.possessGoods}">
                <li class="shopGoodsLi">
                    <img src="${shopItem.imgDir}" style="width:180px;height: 180px">
                    <p style="height: 20px; overflow:hidden;color: black;font-size:16px;text-align: center;margin-top: 5px; width:180px;margin-bottom: 5px"><span>${shopItem.goodsName}</span></p>
                    <p style="color: #f40;font-size:16px;text-align: center; width:180px;margin-bottom: 5px"><span>￥${shopItem.price}</span></p>
                    <a href="manageShopPrice.jsp?oldPrice=${shopItem.price}" class="shopGoods_btn1" style="margin-left: 5px">调整价位</a>
                    <a href="" class="shopGoods_btn1" style="margin-left: 10px">下架商品</a>
                </li>
                </c:forEach>
            </ul>
        </div>

    </div>

</div>
<!-- 管理订单界面 -->
<div id="a3_divWrapper" >
    <p style="font-size: 25px;margin-top: 15px;margin-left: 80px;font-weight: bold;">订单管理</p>
    <div id="div3">
        <ul id="div3-ul1">
            <li style="width: 180px">商品详情</li>
            <li >商品数目</li>
            <li>商品单价</li>
            <li>商品总价格</li>
            <li>买家地址</li>
            <li style="margin-left:30px">联系方式</li>
            <li style="margin-left:38px">买家姓名</li>
            <li style="margin-left:28px">商品状态</li>
            <li style="margin-left:35px">操作</li>
          </ul>

        <!--  加载已付款的订单   -->
        <c:forEach var="orderItem" items="${sessionScope.merchantOrderList.payList}">
        <div class="div3-sonDiv">
        <ul class="div3-sonDiv-ul">
            <li style="width:200px;margin-left: 0px;overflow: hidden">
                <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"/>
                <p style="margin-top:10px;word-break: break-all;text-align: center"><span>${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</span></p>
            </li>
            <li style="width:70px;overflow: hidden;">
                <p style="margin-top:30px;word-break: break-all;width: 70px;text-align: center"><span>${orderItem.sumOfGoods}</span>
                </p>
            </li>

            <li style="width:85px;overflow: hidden;">
                <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:85px;text-align: center;color: #f40"><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span>
                </p>
            </li>
            <li style="width:100px;padding-left: 5px">
                <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:100px;text-align: center;color: #f40">
                    <span>￥${orderItem.totalMoney}</span>
            </p></li>

            <li style="width:100px;padding-left: 5px"><p style="margin-top: 10px">
                <span>${orderItem.addr}</span></p></li>
            <li style="width:105px;padding-left: 5px"><p style="margin-top:30px">
                <span>${orderItem.phone}</span></p></li>

            <li style="width:80px;padding-left: 5px"><p style="margin-top:30px">
                <span>${orderItem.name}</span></p></li>
            <li style="width:80px;padding-left: 5px;margin-left:42px"><p style="margin-top:30px">
                <span>已付款</span></p></li>
            <li style="width: 120px">
                <ul class="operate-ul"style="margin-top: 20px" >
                    <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block" href="merchant.do?action=sendGood&userId=${orderItem.id}&goodsId=${orderItem.goodsId}&payFlag=${orderItem.payFlag}">发货</a></li>
                    <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系买家</a></li>
                  </ul>
            </li>
        </ul>
        </div>
        </c:forEach>

        <!--  加载退货的订单   -->
        <c:forEach var="orderItem" items="${sessionScope.merchantOrderList.backList}">
            <div class="div3-sonDiv">
                <ul class="div3-sonDiv-ul">
                    <li style="width:200px;margin-left: 0px;overflow: hidden">
                        <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"/>
                        <p style="margin-top:10px;word-break: break-all;text-align: center"><span>${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</span></p>
                    </li>
                    <li style="width:70px;overflow: hidden;">
                        <p style="margin-top:30px;word-break: break-all;width: 70px;text-align: center"><span>${orderItem.sumOfGoods}</span>
                        </p>
                    </li>

                    <li style="width:85px;overflow: hidden;">
                        <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:85px;text-align: center;color: #f40"><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span>
                        </p>
                    </li>
                    <li style="width:100px;padding-left: 5px">
                        <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:100px;text-align: center;color: #f40">
                            <span>￥${orderItem.totalMoney}</span>
                        </p></li>

                    <li style="width:100px;padding-left: 5px"><p style="margin-top: 10px">
                        <span>${orderItem.addr}</span></p></li>
                    <li style="width:105px;padding-left: 5px"><p style="margin-top:30px">
                        <span>${orderItem.phone}</span></p></li>

                    <li style="width:80px;padding-left: 5px"><p style="margin-top:30px">
                        <span>${orderItem.name}</span></p></li>
                    <li style="width:80px;padding-left: 5px;margin-left:42px"><p style="margin-top:30px">
                        <span>请求退货</span></p></li>
                    <li style="width: 120px">
                        <ul class="operate-ul"style="margin-top: 20px" >
                            <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block">批准退货</a></li>
                            <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系买家</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </c:forEach>

        <!--  加载货到付款的订单   -->
        <c:forEach var="orderItem" items="${sessionScope.merchantOrderList.waitPayList}">
            <div class="div3-sonDiv">
                <ul class="div3-sonDiv-ul">
                    <li style="width:200px;margin-left: 0px;overflow: hidden">
                        <img src="${sessionScope.allGoods.get(orderItem.goodsId).imgDir}" class="goodsImg"/>
                        <p style="margin-top:10px;word-break: break-all;text-align: center"><span>${sessionScope.allGoods.get(orderItem.goodsId).goodsName}</span></p>
                    </li>
                    <li style="width:70px;overflow: hidden;">
                        <p style="margin-top:30px;word-break: break-all;width: 70px;text-align: center"><span>${orderItem.sumOfGoods}</span>
                        </p>
                    </li>

                    <li style="width:85px;overflow: hidden;">
                        <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:85px;text-align: center;color: #f40"><span>￥${sessionScope.allGoods.get(orderItem.goodsId).price}</span>
                        </p>
                    </li>
                    <li style="width:100px;padding-left: 5px">
                        <p style="font-weight: bold;margin-top:30px;word-break: break-all;width:100px;text-align: center;color: #f40">
                            <span>￥${orderItem.totalMoney}</span>
                        </p></li>

                    <li style="width:100px;padding-left: 5px"><p style="margin-top: 10px">
                        <span>${orderItem.addr}</span></p></li>
                    <li style="width:105px;padding-left: 5px"><p style="margin-top:30px">
                        <span>${orderItem.phone}</span></p></li>

                    <li style="width:80px;padding-left: 5px"><p style="margin-top:30px">
                        <span>${orderItem.name}</span></p></li>
                    <li style="width:80px;padding-left: 5px;margin-left:42px"><p style="margin-top:30px">
                        <span>货到付款</span></p></li>
                    <li style="width: 120px">
                        <ul class="operate-ul"style="margin-top: 20px" >
                            <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;"><a style="display: inline-block" href="merchant.do?action=sendGood&userId=${orderItem.id}&goodsId=${orderItem.goodsId}&payFlag=${orderItem.payFlag}">发货</a></li>
                            <li class="operate-li" style="  height:20px; width:100px;float: left;display: inline-block;margin-top: 10px"><a style="display: inline-block">联系买家</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </c:forEach>

    </div>

</div>

</body>
</html>
