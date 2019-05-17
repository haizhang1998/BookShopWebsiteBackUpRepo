<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/5/2
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html  xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>管理员界面</title>
</head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!--@*3、bootstrap table组件以及中文包的引用*@-->
<script src="/tableCss/bootstrap-table.js"></script>
<link href="/tableCss/bootstrap-table.css" rel="stylesheet" />
<script src="/tableCss/bootstrap-table-zh-CN.js"></script>
<script src="../tableCss/lodash.min.js"></script>

<script>

    $(function () {
        //1.初始化操作用户面板的table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

        //初始化冻结面板
        var freezeTable=new FreezeTableInit();
        freezeTable.Init();
        var oFreezeButtonInit=new freezeButtonInit();
    });



    var optionJson=[];

    //editSave会将修改的数据post到后台，后台进行数据的查询判断
    function editSave(){
        var userId=$("#id").val();
        var userAddr=$("#addr").val();
        var userPhone=$("#phone").val();
        $.ajax({
            url:"/sys/editUser",
            type:"POST",
            data:{
                id:userId,
                addr:userAddr,
                phone:userPhone
            },
            dataType:"json"

        }).done(function(data){
                alert(data.msg);
                if(data.msg == '修改成功!'){
                   $("#tb_departments").bootstrapTable("refresh","/sys/queryAlUser")
                } //收到服务器的返回修改成功的json数据后，清除input中的数据
            }
        );
    }

    //删除用户事件
    function btnRemove(){
        var row = $.map($('#tb_departments').bootstrapTable('getSelections'),function(row){return row;});//获取勾选的数据的值
        $.ajax({
            url:"/sys/deleteUser",
            type:"POST",
            data:{
                id:row[0].id
            },
            dataType:"json"

        }).done(function(data){
                alert(data.msg);
                $("#tb_departments").bootstrapTable("refresh",{url:'/sys/queryAllUser'});
            }
        );
    }

    //确认冻结
    function confirmFreeze(){
        var userId=$("#freeze_userId").val();
        var reason=$("#reason").val();
        var endDate=$("#endDate").val();
        $.ajax({
            url:"/sys/freezeUser",
            type:"POST",
            data:{
                userId:userId,
                reason:reason,
                endDate:endDate
            },
            dataType:"json"

        }).done(function(data){
                alert(data.msg);
                if(data.msg=="冻结成功!"){
                    $("#tb_departments").bootstrapTable("refresh",{url:'/sys/queryAlUser'});
                }
            }
        );
    }

    //获取所有的申请
    function queryAllRequest() {

        $.ajax({
            url:"/sys/queryAllRequest",
            type:"POST",
            data:{},
            dataType:"json"

        }).done(function(data){
                 optionJson=data;
                 var str="";
                 // alert(optionJson[0].userId);
                     for(var i=0;i<optionJson.length;i++){
                     <c:set var="index" value="1" scope="page"/>
                     str+="     <div class=\"row\" style=\"border: 1px solid #e7e7e7;margin-top: 10px;padding: 10px\">\n" +
                         "                        <div class=\"col-md-9\" >\n" +
                         "                            <div class=\"row\">\n" +
                         "                                <div class=\"media col-md-4\">\n" +
                         "                                    <div class=\"media-left\">\n" +
                         "                                        <a href=\"#\">\n" +
                         "                                            <img class=\"media-object\" src=\""+optionJson[i].shopLogo+"\" alt=\"用户头像\" width=\"64px\" height=\"64px\">\n" +
                         "                                        </a>\n" +
                         "                                    </div>\n" +
                         "                                    <div class=\"media-body\">\n" +
                         "                                        <h4 class=\"media-heading\" style=\"margin-top:10px;margin-bottom: 10px\">店铺名称:<span>"+optionJson[i].shopName+"</span></h4>\n" +
                         "                                        <span>发货地址:"+optionJson[i].addr+"</span>\n" +
                         "                                    </div>\n" +
                         "                                </div>\n" +
                         "                                <h4 class=\"col-md-2 text-right\">申请内容:</h4>\n" +
                         "                                <div class=\"tab_content col-md-6\"  style=\"border: 1px dotted #e7e7e7;\">\n" +
                         "                                       "+optionJson[i].detail+"    \n" +
                         "                                </div>\n" +
                         "                            </div>\n" +
                         "                        </div>\n" +
                         "                        <div class=\"col-md-3 text-center\" style=\"padding-top: 20px;\" >\n" +
                         "                            <button type=\"button\" class=\"btn btn-success btn-md\" onclick=\"checkRequest("+i+")\">审批</button>\n" +
                         "                            <button type=\"button\" class=\"btn btn-success btn-md\" onclick=\"delRequest("+i+")\">删除</button>\n" +
                         "                        </div>\n" +
                         "                    </div>"
                 }
                 document.getElementById("request_container").innerHTML=str;
            }
        );
    }

    //处理审批申请
    function checkRequest(id){
        // alert(id);
        // alert(optionJson[id].detail)
        $("#userId").val(optionJson[id].userId);
        $("#detail").val(optionJson[id].detail);
        $("#shopName").val(optionJson[id].shopName);
        $("#requestId").val(optionJson[id].requestId);
        $("#checkModal").modal();
    }

    //删除请求
    function  delRequest(id) {
        var msg="您确定要删除请求编号为"+optionJson[id].requestId+"的请求记录吗"
        if(confirm(msg)){
            $.ajax({
                url:"/sys/delShopRequest",
                type:"POST",
                data:{requestId:optionJson[id].requestId},
                dataType:"json"

            }).done(function(data){
                alert(data.msg);
                if(data.msg=="删除成功!"){
                    queryAllRequest();
                }
              }
        )
        }
    }


    //批准或者拒绝开店
    function operateShop(type){
        var s=0;
        if(type == 'accept'){
          s=1;
        }

        $.ajax({
            url:"/sys/operateShopRequest",
            type:"POST",
            data:{
                state:s,
                reason:$("#feedback_reason").val(),
                userId:$("#userId").val(),
                requestId:$("#requestId").val(),
                id:${sessionScope.userInfo.id}
            },
            dataType:"json"
        }).done(function(data){
            alert(data.msg);
            if(data.msg=="操作成功!"){
                queryAllRequest();
            }
        });
    }


    //初始化用户查询界面
    var TableInit = function () {
        window.operateEvents = {
            "click #TableEditor":function(ev,value,row,index){
                $('#myModal').modal();
                $('.modal-body input[name = id]').val(row.id);
                $('.modal-body input[name = name]').val(row.name);
                $('.modal-body input[name = username]').val(row.username);
                $('.modal-body input[name = addr]').val(row.addr);
                $('.modal-body input[name = phone]').val(row.phone);
                $('.modal-body input[name = freezeFlag]').val(row.freezeFlag);

            },
            'click #TableFreeze': function (e, value, row, index) {
                $('#freezeModal').modal();
                $('.modal-body input[name = freeze_userId]').val(row.id);
            }
        }
//使用函数，添加按钮
        function AddFunctionAlty(value,row,index){
            if (row['freezeFlag'] === 1) {
                return [
                    '<button id = "TableEditor" type="button" class = "btn btn-success btngroup" data-toggle="modal"  data-target:"#myModal">编辑</button>&nbsp;&nbsp;&nbsp;',
                    '<button id = "TableFreeze" type="button" disabled="disabled" class = "btn btn-danger btngroup">冻结</button>',
                ].join('');
            }


            return [
                '<button id = "TableEditor" type="button" class = "btn btn-success btngroup" data-toggle="modal"  data-target:"#myModal">编辑</button>&nbsp;&nbsp;&nbsp;',
                '<button id = "TableFreeze" type="button" class = "btn btn-success btngroup">冻结</button>',
            ].join('');
        }


        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
                url: '/sys/queryAllUser',         //请求后台的URL（*）
                method: 'POST',                      //请求方式（*）
                dataType : "json", //后端数据传递类型
                contentType : "application/x-www-form-urlencoded",
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                dataField : "data",
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    field:'state',
                    checkbox: true
                }, {
                    field: 'id',
                    title: '用户编号'
                }, {
                    field: 'name',
                    title: '姓名'
                },{
                    field: 'phone',
                    title: '手机'
                }, {
                    field: 'addr',
                    title: '地址'
                },
                    {
                        field: 'freezeFlag',
                        sortable: true,//启用排序,
                        title: '冻结状态',
                        formatter : function (value, row, index) {
                            if (row['freezeFlag'] === 1) {
                                return '已冻结';
                            }
                            if (row['freezeFlag'] === 0) {
                                return '正常';
                            }
                            return value;
                        }
                    },
                    {
                        field: 'username',
                        title: '用户名'
                    },
                    {
                        field: 'Button',
                        title: '操作',
                        events: operateEvents,
                        formatter:AddFunctionAlty//表格中增加按钮
                    }
                ]

            });
        };


        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset  //页码
            };
            return temp;
        };
        return oTableInit;
    };
    //按钮初始化界面
    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};
        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

    //冻结面板的table
    var FreezeTableInit = function () {
        window.operateEvents = {
            "click #unFreezeBtn":function(ev,value,row,index){
                var confirm_msg="确认是否将冻结编号为"+row['userId']+"的用户解冻"
                if(confirm(confirm_msg)){
                    $.ajax({
                        url:"/sys/unFreezeUser",
                        type:"POST",
                        data:{
                            userId:row['userId']
                        },
                        dataType:"json"
                    }).done(function(data){
                        alert(data.msg);
                        if(data.msg=="解冻成功！"){
                            $("#tb_freezeTable").bootstrapTable("refresh",{url:'/sys/queryFreezeRecordByPage'});
                        }
                    });
                }
            }
        };

        function AddFreezeAlty(value,row,index){
            return [
                '<button id = "unFreezeBtn" type="button" class = "btn btn-success btngroup" data-toggle="modal" >解冻</button>&nbsp;&nbsp;&nbsp;'
            ].join('');
        }

        var  freezeTableInit= new Object();
        freezeTableInit.Init = function () {

            $('#tb_freezeTable').bootstrapTable({
                url: '/sys/queryFreezeRecordByPage',         //请求后台的URL（*）
                method: 'POST',                      //请求方式（*）
                dataType : "json", //后端数据传递类型
                contentType : "application/x-www-form-urlencoded",
                toolbar: '#toolbar2',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                dataField : "data",
                queryParams: freezeTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    field:'state',
                    checkbox: true,
                },
                    {
                        field: 'id',
                        title: '冻结编号'
                    },
                    {
                    field: 'userId',
                    title: '用户编号'
                },
                    {
                        field: 'userInfo.name',
                        title: '用户姓名'
                    },
                    {
                    field: 'date',
                    title: '起始日期'
                },{
                    field: 'endDate',
                    title: '终止日期'
                },


                    {
                        field: 'reason',
                        title: '冻结原因'
                    },
                    {
                        field: 'Button',
                        title: '操作',
                        events: operateEvents,
                        formatter:AddFreezeAlty//表格中增加按钮
                    }
                ]

            });
        };

        //得到查询的参数
        freezeTableInit.queryParams = function (params) {
            var temp2 = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset  //页码
            };
            return temp2;
        };
        return freezeTableInit;
    };
    var freezeButtonInit = function () {
        var oInit = new Object();
        var postdata = {};

        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

</script>

<style>
    #headLogoSection{
        background:black;
        color:white;
        padding: 10px;
    }


    #head-a {
        text-decoration: none;
    }
    #head-a:hover {
        text-decoration: none;
        color:antiquewhite;
    }
    #head-a:active{
        text-decoration: none;
        color: white;
    }
    #head-a:visited{
        text-decoration: none;
        color: white;
    }
    #head-a:link{
        text-decoration: none;
        color: white;

    }

    #secondSection{
        margin-top:60px;
    }

    .tab_content{
        overflow: hidden;
        text-overflow: ellipsis;
        display:-webkit-box;
        -webkit-box-orient:vertical;
        -webkit-line-clamp:3;
        height:58px;
    }

</style>
<body>
<section id="headLogoSection">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>系统管理界面 <small style="color:white;margin-top:10px;margin-left: 20px">当前时间2019/5/2</small></h2>
            </div>
            <div class="pull-right col-md-2" style="margin-top: 25px;" >
                <a id="head-a" href="/user/logout" style="font-size: 20px" ><span class="glyphicon glyphicon-off" ></span>注销</a>
            </div>
        </div>
    </div>
</section>

<section id="secondSection" style="margin-bottom:100px">
    <div class="container">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a  href="#home" aria-controls="home"  role="tab" data-toggle="tab">操作用户面板</a></li>
            <li role="presentation"><a  href="#profile" onclick="queryAllRequest()" aria-controls="profile" role="tab" data-toggle="tab">申请卖家面板</a></li>
            <li role="presentation"><a  href="#settings"  aria-controls="settings" role="tab" data-toggle="tab">冻结列表</a></li>
        </ul>


<%--        查询用户--%>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home">
                    <div class="table-responsive">
                        <div class="panel-body" style="padding-bottom:0px;">
                            <div class="panel panel-default">
                                <div class="panel-heading">查询条件</div>
                                <div class="panel-body">
                                    <form id="formSearch" class="form-horizontal">
                                        <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_user">用户名称</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" id="txt_search_user">
                                            </div>
                                            <label class="control-label col-sm-1" for="txt_search_status">状态</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" id="txt_search_status">
                                            </div>
                                            <div class="col-sm-4" style="text-align:left;">
                                                <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="toolbar" class="btn-group">
                                <button id="btn_add" type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                                </button>
                                <button id="btn_edit" type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                </button>
                                <button id="btn_delete" type="button" class="btn btn-default" onclick="btnRemove()">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
                                </button>
                            </div>
                            <table id="tb_departments" data-side-pagination="server"
                                   data-pagination="true">
                            </table>
                        </div>
                    </div>
                </div>


                <!--//申请卖家面板-->
                <div role="tabpanel" class="tab-pane fade" id="profile">
                    <div class="container-fluid" id="request_container" style="margin-top: 10px">
                    </div>
                </div>

<%--            获取冻结列表--%>
                 <div role="tabpanel" class="tab-pane fade" id="settings">
                    <div class="table-responsive">
                        <div class="panel-body" style="padding-bottom:0px;">
                            <div class="panel panel-default">
                                <div class="panel-heading">查询条件</div>
                                <div class="panel-body">
                                    <form id="formSearch2" class="form-horizontal">
                                        <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_user2">用户名称</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" id="txt_search_user2">
                                            </div>
                                            <label class="control-label col-sm-1" for="txt_search_status2">状态</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" id="txt_search_status2">
                                            </div>
                                            <div class="col-sm-4" style="text-align:left;">
                                                <button type="button" style="margin-left:50px" id="btn_query2" class="btn btn-primary">查询</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div id="toolbar2" class="btn-group">
                                <button id="btn_add2" type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                                </button>
                                <button id="btn_edit2" type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                </button>
                                <button id="btn_delete2" type="button" class="btn btn-default" >
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
                                </button>
                            </div>
                            <table id="tb_freezeTable" data-side-pagination="server"
                                   data-pagination="true">
                            </table>
                        </div>
                </div>
            </div>
            </div>
<%--        定义模态框    --%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">编辑</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="id">用户编号</label>
                            <input type="text" disabled="disabled" name="id" id="id" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" disabled="disabled" name="username" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="name">姓名</label>
                            <input type="text"  disabled="disabled" name="name" id="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="addr">地址</label>
                            <input type="text" name="addr" id="addr" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="phone">手机</label>
                            <input type="text"  name="phone" id="phone" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="freezeFlag">冻结状态</label>
                            <input type="text" disabled="disabled"   name="freezeFlag" id="freezeFlag" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="editSave()"><span class="" aria-hidden="true"></span>保存</button>
                    </div>
                </div>
            </div>
        </div>
<%--        定义冻结模态框 --%>
        <div class="modal fade" id="freezeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="freezeModalLabel">冻结记录填写</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="id">用户编号</label>
                            <input type="text" disabled="disabled" name="freeze_userId" id="freeze_userId" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="endDate">冻结终止日期</label>
                            <input type="date" name="username" id="endDate" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="reason">冻结原因</label>
                            <input type="text" name="reason" id="reason" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="freeze_submit" class="btn btn-primary" data-dismiss="modal" onclick="confirmFreeze()"><span class="" aria-hidden="true"></span>确认冻结</button>
                    </div>
                </div>
            </div>
        </div>

<%--        定义审批模态框--%>
        <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="checkModalLabel">审批单编号:<input type="text" style="border: none; background: white" disabled="disabled" name="requestId" id="requestId"></input></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="userId">用户编号</label>
                            <input type="text" disabled="disabled" name="userId" id="userId" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="shopName">商店名称</label>
                            <input type="text" disabled="disabled" name="shopName" id="shopName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="detail">审批信息</label>
                            <textarea rows="5" cols="105" disabled="disabled" name="detail" id="detail" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="feedback_reason" style="color:red">反馈信息<span style="color:red">*</span></label>
                            <textarea rows="5" cols="105"  name="feedback_reason" placeholder="请输入至少5到80个字之间的反馈信息" id="feedback_reason" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="accept_request_btn" class="btn btn-primary" data-dismiss="modal" onclick="operateShop('accept')"><span class="" aria-hidden="true"></span>批准</button>
                        <button type="button" id="reject_request_btn" class="btn btn-primary" data-dismiss="modal" onclick="operateShop('reject')"><span class="" aria-hidden="true"></span>拒绝</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>