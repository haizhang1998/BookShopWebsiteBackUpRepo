<%--
  Created by IntelliJ IDEA.
  User: 咯还长
  Date: 2019/5/2
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<script>

    $(function () {


        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });


    var TableInit = function () {
        window.operateEvents = {
            "click #TableEditor":function(ev,value,row,index){
                $('#myModal').modal();
                $('.modal-body input[name = name]').val(row.name);
                $('.modal-body input[name = username]').val(row.username);
                $('.modal-body input[name = addr]').val(row.addr);
                $('.modal-body input[name = phone]').val(row.phone);


            }
        }
//使用函数，添加按钮
        function AddFunctionAlty(value,row,index){
            return [
                '<button id = "TableEditor" type="button" class = "btn btn-info btngroup" data-target:"#myModal" >编辑</button>',
                '<button id = "TableDelete" type="button" class = "btn btn-info btngroup"  data-target:"#myModal">删除</button>',
            ].join('');
        }

        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
                url: '/sys/queryAlUser',         //请求后台的URL（*）
                method: 'POST',                      //请求方式（*）
                dataType : "json", //后端数据传递类型
                contentType : "application/x-www-form-urlencoded",
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                dataField : "data",
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 7,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    field:'state',
                    checkbox: true
                }, {
                    field: 'name',
                    title: '姓名'
                }, {
                    field: 'phone',
                    title: '手机'
                }, {
                    field: 'addr',
                    title: '地址'
                }, {
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
                offset: params.offset,  //页码
            };
            return temp;
        };
        return oTableInit;
    };


    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};

        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };
    $('#myModal').modal();
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

<section id="secondSection">
    <div class="container">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a  href="#home" aria-controls="home" role="tab" data-toggle="tab">操作用户面板</a></li>
            <li role="presentation"><a  href="#profile" aria-controls="profile" role="tab" data-toggle="tab">申请卖家面板</a></li>
            <li role="presentation"><a  href="#messages" aria-controls="messages" role="tab" data-toggle="tab">查询用户面板</a></li>
            <li role="presentation"><a  href="#settings" aria-controls="settings" role="tab" data-toggle="tab">冻结列表</a></li>
        </ul>


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
                            <button id="btn_delete" type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                            </button>
                        </div>
                        <table id="tb_departments" data-side-pagination="server"
                               data-pagination="true">

                        </table>
                    </div>
                </div>
            </div>


            <div role="tabpanel" class="tab-pane fade" id="profile">

            </div>
            <div role="tabpanel" class="tab-pane fade" id="messages">...</div>
            <div role="tabpanel" class="tab-pane fade" id="settings">...</div>
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
                            <label for="username">用户名</label>
                            <input type="text" disabled="disabled" name="username" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="name">姓名</label>
                            <input type="text" name="name" id="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="addr">地址</label>
                            <input type="text" name="addr" id="addr" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="phone">手机</label>
                            <input type="text" disabled="disabled"  disabled="disabled" name="phone" id="phone" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="" aria-hidden="true"></span>保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--<div class="table-responsive">-->
    <!--<table class="table">-->
    <!--<thead>123</thead>-->
    <!--<thead>123</thead>-->
    <!--<thead>123</thead>-->
    <!--</table>-->
    <!--</div>-->
</section>
</body>
</html>