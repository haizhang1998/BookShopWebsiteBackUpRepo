<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/5/12
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!--<script src="js/homePage.js"></script>-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<html>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style type="text/css">
    .tabpan-ul{
        margin-left: 500px;
        display: inline-block;
        list-style: none;
        margin-top: 50px;

    }
    .tabpan-ul .tabpan-li{
        float: left;
    }
    .tabpan-li a{
        padding:20px;
        text-decoration: none;
        font-size: 22px;
    }


    .activeA{
        background:black;
        color:white;
    }

    .disActiveA {
        background: #e7e7e7;
        color:black;
    }
</style>
<script>
    $(document).ready(function () {
            $("#a1").click(function () {
                if($(this).attr("class")==="disActiveA"){
                    $("#a2").attr("class","disActiveA");
                    $("#a3").attr("class","disActiveA");
                    $(this).attr("class","activeA");
                }

            });

            $("#a2").click(function () {
                if($(this).attr("class")==="disActiveA"){
                    $("#a1").attr("class","disActiveA");
                    $("#a3").attr("class","disActiveA");
                    $(this).attr("class","activeA");
                }
            });
            $("#a3").click(function () {
                if($(this).attr("class")==="disActiveA"){
                    $("#a1").attr("class","disActiveA");
                    $("#a2").attr("class","disActiveA");
                    $(this).attr("class","activeA");
                }
            });
        }
    );

    //修改价格
    function revisePrice(){
        $("#reviseGoodsModel").modal();
    }

        //检查店铺信息
        function oncheck() {

        var shopName=document.getElementById("shopName");
        var addr=document.getElementById("addr");
        alert(shopName.val());
        if(shopName.val().length==0){
            alert("店铺名不得为空!");

            return false;
        }
        if(addr.val().trim()==""){
            alert("店铺地址不得为空!");
            return false;
        }

        return true;
    }


    //提交店铺更新
    function updateShopInfo(){
            alert(3);
            $.ajax({
                url:"/merchant/updateShopInfo",
                type:"POST",
                data: $('#shopForm').serialize(),
                cache:false,
                dataType:"json"

            }).done(function(data){
                   alert(12);
            });
    }

    function subBtn(){
        $('#shopForm').submit(function () {
        updateShopInfo();
    });
    }

    //获取所有货物列表
    function qeuryGoods(){

        $.ajax({
            url:"/merchant/queryAllGoods",
            type:"POST",
            data:{
                merchantId:${sessionScope.userInfo.id}
            },
            dataType:"json"

        }).done(function(data){
            optionJson=[];
            optionJson=data;
            var str="";
            alert(optionJson.length);
                for(var i=0;i<optionJson.length;i++){
                   str+="<div class=\"col-sm-4 col-md-3\">\n" +
                       "                    <div class=\"thumbnail\">\n" +
                       "                        <img src=\""+optionJson[i].imgDir+"\" style=\"width: 134px;height: 180px\" alt=\"商品土坯an\" class=\"tab_img\">\n" +
                       "                        <div class=\"caption\">\n" +
                       "                            <h4 class=\"tab_content\">"+optionJson[i].goodsName+"</h4>\n" +
                       "                            <p><span style=\"color: #f40;\" class=\"text-center\">价格"+optionJson[i].price+"</span></p>\n" +
                       "                            <p><a href=\"#\" onclick=\"revisePrice()\" class=\"btn btn-primary\" role=\"button\">调整价位</a>\n" +
                       "                                <a onclick=\"downGoods()\" class=\"btn  btn-success\"  role=\"button\">下架货物</a>\n" +
                       "                            </p>\n" +
                       "                        </div>\n" +
                       "                    </div>\n" +
                       "                </div>"
                }
                document.getElementById("goodsList").innerHTML=str;

            }
        );
    }

    //下架货物
    function downGoods(){

    }
</script>
<body>

<%--导航栏--%>
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

                    <li>
                        <c:choose>
                        <c:when test="${sessionScope.userInfo==null}">
                        <a href="/user/login">
                    <li>亲，请登录</li>
                    <span class="sr-only">(current)</span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="/user/revise">
                            <li>欢迎，${sessionScope.userInfo.nikeName}</li>
                            <span class="sr-only">(current)</span></a>
                    </c:otherwise>
                    </c:choose>
                    </li>
                    <li><a href="#">消息<span class="badge">0</span></a></li>

                    <c:if test="${sessionScope.userInfo.merchantFlag==0}">
                        <li>
                            <a href="#">店铺管理</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.requestRecordShop==null}">
                        <li><a onclick="openShop()">我要开店</a></li>
                    </c:if>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">收藏夹</a></li>
                            <li><a href="#">反馈信息<span class="badge"></span> </a> </li>
                            <li><a href="#">我的足迹</a></li>
                            <li><a href="#">我的订单</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav" style="margin-left: 500px">
                    <li><a href="#"><span>购物车<span class="badge" style="margin-left: 5px">0</span></span></a></li>
                    <li><a href="/user/revise">个人中心</a></li>
                    <li><a href="/user/logout">注销</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</section>

<section  style="margin-top: 30px;background: #e7e7e7; height: 100px">
    <h1 style="color: black;font-weight: bold;padding:20px;line-height: 20px;display: inline-block;float: left" >卖家管理界面</h1>
    <ul class="tabpan-ul" role="tablist" >
        <li  role="presentation" class="active tabpan-li"><a href="#shopInfo" id="a1" class="activeA" aria-controls="home" role="tab" data-toggle="tab">店铺信息</a></li>
        <li role="presentation" onclick="qeuryGoods()" class="tabpan-li"><a href="#goodsInfo"   id="a2"  class="disActiveA" aria-controls="profile" role="tab" data-toggle="tab">货物信息</a></li>
        <li role="presentation" class="tabpan-li"><a href="#upgoods"  id="a3"  class="disActiveA" aria-controls="profile" role="tab" data-toggle="tab">上架货物</a></li>
    </ul>
</section>

<!--具体操作-->
<section style="margin-top: 20px;margin-left: -23px;margin-bottom: 200px;" class="container-fluid">
    <div class="tab-content" style="margin-left: 40px;margin-top: 20px">
        <!--修改信息-->
        <div role="tabpanel" class="tab-pane fade in active" id="shopInfo" style="padding-left: 150px">
           <sf:form method="post" commandName="merchantShop" enctype="multipart/form-data" name="updateShopForm" id="shopForm">
                <div class="row">
                    <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">店铺名称:</span>
                    <sf:input type="text" maxlength="120" size="50" path="shopName" style="height: 40px;padding:20px;font-size: 21px"/>
                    <sf:errors path="shopName" id="shopName" cssStyle="color:red"></sf:errors>
                </div>
                <div class="row" style="margin-top: 20px">
                    <span style="color:#3B3B3B;font-size: 22px; margin-right: 20px; font-weight: bold" >店铺头像:</span>
                    <img src="${merchantShop.shopLogo}" width="100px" height="100px">
                    <input type="file" value="更换头像" name="shopLogo" id="shopLogo"  style="display:inline-block;" class="btn-primary">
                </div>
                <div class="row" style="margin-top: 20px">
                    <span style="color:#3B3B3B;font-size: 22px;margin-right: 20px; font-weight: bold">店铺地址:</span>
                    <sf:input type="text" path="addr"  id="addr"  maxlength="120" size="50"  style="height: 40px;padding:20px;font-size: 21px" />
                    <sf:errors cssStyle="color:red"></sf:errors>
                </div>
                <div class="row" style="margin-top: 20px">
                    <button  class="btn btn-success btn-lg col-md-5 col-md-offset-2"  onclick="subBtn()">提交</button>
                </div>
           </sf:form>

        </div>

<%--        货物列表--%>
        <div role="tabpanel" class="tab-pane fade" id="goodsInfo">
            <div class="row"  id="goodsList" style="margin-top:30px">
            </div>
        </div>
        <!--上架货物-->
        <div role="tabpanel" class="tab-pane fade" id="upgoods" style="margin-left: 200px">
            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物名称:</span>
                <input type="text" maxlength="120" size="50" name="goodsName" style="height: 40px;padding:20px;font-size: 21px" value="asdasdas" >
            </div>
            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">发货地址:</span>
                <input type="text" maxlength="120" size="50" name="addr" style="height: 40px;padding:20px;font-size: 21px" value="asdasdas" >
            </div>
            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物库存:</span>
                <input type="text" maxlength="120" size="50" name="remainNumber" style="height: 40px;padding:20px;font-size: 21px" placeholder="货物库存必须大于0" >
            </div>
            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物价格:</span>
                <input type="text" maxlength="120" size="50" name="price" style="height: 40px;padding:20px;font-size: 21px" value="asdasdas" >
            </div>
            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物详细描述:</span>
                <input type="text" maxlength="120" size="50" name="detail" style="height: 40px;padding:20px;font-size: 21px" value="asdasdas" >
            </div>

            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物类型:</span>
                <select style="font-size: 22px;padding: 10px;text-align:center;text-align-last:center;" name="type">
                    <option value="">-----</option>
                    <option value="科学技术">科学技术</option>
                    <option value="儿童书籍">儿童书籍</option>
                    <option value="小说">小说</option>
                    <option value="军事历史">军事历史</option>
                    <option value="家庭养生">家庭养生</option>
                    <option value="艺术设计">艺术设计</option>
                    <option value="文学">文学</option>
                </select>
            </div>

            <div class="row" style="margin-top:15px">
                <span style="color:#3B3B3B;font-size: 22px; font-weight: bold;margin-right: 20px">货物图片:</span>
                <input name="imageLogo" type="file" style="display: inline-block">
            </div>
        </div>
    </div>
</section>
<!--模态框定义-->
<div class="modal fade" id="reviseGoodsModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="reviseGoodsModelLabel">修改价格表单填写</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="goodsId">货物编号</label>
                    <input type="text" disabled="disabled" name="freeze_userId" id="goodsId" class="form-control">
                </div>

                <div class="form-group">
                    <label for="goodsName">货物名称</label>
                    <input type="text"  disabled="disabled"  name="username" id="goodsName" class="form-control">
                </div>
                <div class="form-group">
                    <label for="primitivePrice">原始价格</label>
                    <input type="text"   disabled="disabled" name="primitivePrice" id="primitivePrice" class="form-control">
                </div>
                <div class="form-group">
                    <label for="price">价格调整</label>
                    <input type="text" name="price" id="price" class="form-control">
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="" aria-hidden="true"></span>关闭</button>
                <button type="button" id="freeze_submit" class="btn btn-primary" data-dismiss="modal" onclick="oncheck()"><span class="" aria-hidden="true"></span>确认调整</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>