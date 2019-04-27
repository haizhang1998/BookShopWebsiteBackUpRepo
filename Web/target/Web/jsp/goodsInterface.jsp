<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2018/11/12
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>商品详细信息</title>
    <link rel="stylesheet" type="text/css" href="css/goodsInterface_css.css">
</head>
<script>

   $(function () {
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
       });
       $("#increaseBtn").click(function () {
           var num=$("#selectNumText").val();
            if(parseInt($("#selectNumText").val())>=0&&parseInt(num)<parseInt(${sessionScope.goodsInfo.remainNumber})){
                $("#selectNumText").val(parseInt($("#selectNumText").val())+1);
            }
       });
       $("#decreaseBtn").click(function () {
           if(parseInt($("#selectNumText").val())>0){
               $("#selectNumText").val(parseInt($("#selectNumText").val())-1);
           }
       });

       $("#addGoodBtn").click(function () {
           var num=$("#selectNumText").val();
           if(parseInt(num)>parseInt(${sessionScope.goodsInfo.remainNumber})){
              alert("超出库存范围！如有需求请联系商家！");
              return ;
           }
           if(parseInt(num)==0){
               alert("请选择数量");
               return;
           }

           <c:if test="${sessionScope.userInfo==null}">
           <c:redirect url="index.jsp"></c:redirect>
           </c:if>
           var num=$("#selectNumText").val();
           window.location.href="Cart.do?action=addInCart&userId=${sessionScope.userInfo.id}&goodsId=${goodsInfo.goodsId}&selectNumber="+num;

       })


       $("#sendComent-a").click(function () {
           var comment=$("#commentAear").val();
           window.location.href="affair.do?action=sendComment&userId=${sessionScope.userInfo.id}&goodsId=${sessionScope.goodsInfo.goodsId}&commentDetail="+comment;

       })
   });




</script>
<style>
    #moneyDiv{
        height:60px;
        width: 510px;
        background-image: url("images/grayBg.jpg");
        background-repeat: no-repeat;
        background-size: 100%,100%;
        float: left;
        margin-top:10px

    }
    img{
        width:300px;
        height: 350px;
    }
</style>
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

<div id="tabDiv">
    <ul>
        <li><a href="goodsInterface.jsp" style="color: white;">所有宝贝</a></li>
    </ul>
</div>
<c:if test="${goodsInfo!=null}">

<div id="goodsDetailWrapper" >
<div class="imgDiv">
    <img src="${goodsInfo.imgDir}" alt="糟糕！网速似乎很慢...."/>
    <a class="enshrine" id="enshrine-a" href="affair.do?action=addEnshrineGood&goodsId=${goodsInfo.goodsId}&userId=${userInfo.id}">点我收藏</a>
</div>
    <div id="goodsDetailDiv">
        <p class="f1" style="height: 23px"><span>书籍名称：${goodsInfo.goodsName}</span></p>
        <p class="f1" style="color:red; font-size:14px;font-weight: normal;width: 510px;height:35px"><span>描述信息:${goodsInfo.detail}</span></p>

        <div id="moneyDiv">
            <div id="moneyDiv-son">
                <p class="f3"><span>商品价格：</span></p>
            <p class="f2" ><span>￥${goodsInfo.price}</span></p>
            </div>
        </div>
        <div id="postPriceDiv">
            <p class="f3" style="margin-top: 7px;"><span>请选择你所在区域:</span></p>
            <div id="selectAddrDiv">
                <select name="Addr" style="background:gold;border: none;height:25px">
                    <option value="广东">广东</option>
                    <option value="北京">北京</option>
                    <option value="上海">上海</option>
                    <option value="南京">南京</option>
                    <option value="重庆">重庆</option>
                    <option value="黑龙江">黑龙江</option>
                </select>

            </div>
            <p class="f3" style="margin-top: 7px;font-size: 14px;margin-left:90px;"><span>运费:</span></p>
            <p class="f3" style="margin-top: 7px;font-size: 16px;margin-left:10px;color: red"><span>￥6</span></p>
        </div>
        <ul id="comment-ul">
            <li class="li3" style="padding-left:50px;padding-right:50px;">销量:<p class="f4"><span>
                <c:out value="${saledInfo.saledNumber}" default="0"></c:out>
            </span></p></li>
            <li class="li3" style="padding-left:50px;padding-right:50px;">库存量：<p class="f4">${goodsInfo.remainNumber}</p></li>
        </ul>

        <div id="selectNumberDiv">
            <p style="margin-right: 50px;margin-left:25px;margin-top:5px;height: 20px;width:80px;display: inline-block;font-size: 15px;color: #6c6c6c">
                购买数量:
            </p>

            <input type="button" id="decreaseBtn" class="btn1" style="margin-right:-4px;" value="<" >
            <input id="selectNumText" type="text" size="3" maxlength="10" style="text-align:center;height:32px;margin-top: 1px" value="0">
            <input type="button" id="increaseBtn" class="btn1" style="margin-left:-4px" value=">">
        </div>

        <div id="addGoodDiv">
            <input type="button"  id="addGoodBtn" value="加入购物车">

            <c:if test="${sessionScope.message=='添加失败'}">
                <script>alert("添加失败")</script>
            </c:if>
        </div>
        <p style="display: inline-block;float: left;margin-top:14px"><span>卖家承诺:正品保障、下单即送、7日包退、诚信交易</span></p>
        <p style="color: #6c6c6c;height: 30px;width: 500px;font-size:14px;background: lightgoldenrodyellow;float: left;margin-top:20px;padding-top:5px;padding-bottom:-1px;"><span>温馨提示：亲,请注意选清楚配送地址喔~</span></p>

    </div>
</div>

    </c:if>
<div id="talkDiv">
    <a href="#">联系卖家</a>
</div>
<div id="bookShortDetailWrapper">
        <a style="text-decoration: none"><p class="p1" style="margin-left: 70px;background: #6c6c6c"><span>商品详情</span></p></a>

    <div id="bookShortDetail_div">
        <textarea class="textarea1" disabled rows="13" cols="106">
            ${sessionScope.goodsInfo.detail}
        </textarea>
    </div>
</div>

<div id="sendCommentDiv" >

    <p class="p1" style="margin-left: 70px;background: whitesmoke;color: black">
        <span>
            发表评论
        </span>
    </p>
    <textarea class="textarea1" id="commentAear" style="margin-left: 70px;" rows="4" cols="105"></textarea>
     <a class="sendComment" id="sendComent-a" >点击发布</a>
     <c:if test="${sessionScope.sendflag==true}"><script>alert("发布成功!")</script></c:if>

</div>

<div id="commentDiv" >
    <a style="text-decoration: none" href="affair.do?action=getAllUserComment&goodsId=${sessionScope.goodsInfo.goodsId}">
    <p class="p1" style="margin-left: 70px;background: whitesmoke;color: black">
        <span>
            累计评价&nbsp;<font style="color: red">${sessionScope.commentList.totalNumber}</font>
        </span>
    </p>
    </a>
    <hr style="margin-left: 70px;width: 1100px">

    <div id="commentDiv-items">
        <c:if test="${sessionScope.commentList==null}">
                <h1> 该商品暂时无人评价喔！</h1>
        </c:if>
        <c:forEach var="comment"  items="${sessionScope.commentList.commentItemList}" >
        <div class="commentDiv-items-innerDiv">
            <p class="p2" >
                <span>评论账户:&nbsp;&nbsp;${comment.value.nikeName}</span>
            </p>
        <ul class="commentDiv-items-ul">
                ${comment.value.commentDetail}
        </ul>
            <div class="commentDiv-items-innerDiv-operate">
                <a class="p2" style="float: right;text-decoration: none;margin-left: 20px" id="delete${comment.key}" href="affair.do?goodsId=${sessionScope.goodsInfo.goodsId}&action=deleteComment">删除</a>
                <p class="p2" style="float: right;margin-right: 20px"><span>发布时间${comment.value.time}</span></p>

            </div>
        </div>
        </c:forEach>
    </div>

</div>

</body>
</html>
