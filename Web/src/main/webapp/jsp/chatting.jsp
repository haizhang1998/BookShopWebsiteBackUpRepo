<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>聊天界面</title>
</head>
<script type="text/javascript">

    var disOnlineNumber;
    var onlineNumber;
    // 正在聊天的人的名字
    var talkingNikename;
    // 正在聊天的人的id
    var talkingUserId=-1;
    // 正在聊天人的头像
    var talkingImageLogo;
    var websocket;
    //存放对应用户的离线消息记录
    var tempMsg={};

    $(function(){
        if('WebSocket' in window){
            //连接服务器i
            var path="ws://"+window.location.host+"/ws";
            websocket = new WebSocket(path);
        }
        //下面有几个回调函数，自动调用
        //打开socket
        websocket.onopen = function (event) {
            //握手成功，会自动调用该函数,同时更新上线和离线列表
            console.log("hand suc:",event);
        };
        //监听消息;用来获取服务端传的消息
        websocket.onmessage = function (event) {

            var v=JSON.parse(event.data);
            var nikeName = v.fromName;
            var imageLogo = v.transportImageLogo;
            var userId = v.from;
            //判断消息如果是text带初始化列表的则是用户刚刚启动初始化列表的消息
            if(v.msgType === 2)
                updateUserList(v);
            //上线
            if(v.msgType === 1){
                addOnlineUser(nikeName,imageLogo,userId);
                disOnlineNumber --;
                $("#userDisOnlineNumber").html(disOnlineNumber);
                onlineNumber++;
                $("#userOnlineNumber").html(onlineNumber);
            }
            //下线
            if(v.msgType === -1){
                alert(nikeName+"下线啦！");
                removeOnlineUser(nikeName,imageLogo,userId);
                disOnlineNumber ++;
                $("#userDisOnlineNumber").html(disOnlineNumber);
                onlineNumber--;
                $("#userOnlineNumber").html(onlineNumber);

            }
            if(v.msgType === 0){
                //普通的信息
                receiveMsg(v);
            }
            if(v.msgType===4){
                //有人添加了你,要求更新用户列表

                if(data.msg === "添加成功！"){
                    //添加成功后发送信息给websocket更新用户列表
                    //检测是否已经连接到服务器
                    if(websocket == null){
                        alert("连接已被断开，请重新登入!");
                        return;
                    }
                    var data={};
                    //添加好友，这里相当于刷新列表
                    data["msgType"]=3;
                    data["text"]="更新我的列表";
                    //发送消息
                    websocket.send(JSON.stringify(data));
            }
            }

        };
        //监听Sokcet关闭(不管是客户端还是服务端关闭，都会触发此时间)
        websocket.onclose = function (event) {
            alert("socketClose");
            console.log("socketClose",event);
        };
        //监听异常
        websocket.onerror = function (event) {
            console.log("发生错误",event);
        };

        //关闭sokcet(客户端主动关闭socket)
        function closeWebsocket() {
            if(websocket != null){
                websocket.close();
                websocket=null;
            }
        }
    });

    //当点击用户列表指定的用户时，talk将动态绑定该用户端信息
    function talk(userInfo){
        var  nikeName = userInfo.nikeName;
        var  imageLogo = userInfo.imageLogo;
        var  id =userInfo.id;
        alert(id);
        alert(nikeName);
        alert(imageLogo);
        talkingNikename=nikeName;
        // 正在聊天的人的id
        talkingUserId=id;
        // 正在聊天人的头像
        talkingImageLogo=imageLogo;
        $("curNikeName").html(talkingNikename);
    }

    //初始化时更新全部用户列表
    function updateUserList(v) {

        //获取离线列表
        var userDisOnlineList=v.userDisOnlineList;
        //获取在线列表
        var userOnlineList=v.userOnlineList;
        disOnlineNumber = userDisOnlineList.length;
        onlineNumber=userOnlineList.length;
        $("#userDisOnlineNumber").html(disOnlineNumber);
        $("#userOnlineNumber").html(onlineNumber);
        if(disOnlineNumber<=0){
            $("#userDisOnlinePage").append("<h4 class='text-muted text-center' id='noPeopleOnlineFlag' style='margin-top: 100px'>没有离线的好友喔</h4>");
        }else{
            //遍历
            for(var i=0;i<disOnlineNumber;i++){
                $("#userDisOnlinePage").append(
                    "<div class=\"media\"  id=\""+userDisOnlineList[i].id+"\" onclick='talk("+userDisOnlineList[i]+")' style=\"width: 95%;margin-top: 20px;margin-left: 20px;cursor: pointer;border: 1px solid #e7e7e7;padding:10px\">\n" +
                    "                        <div class=\"media-left\">\n" +
                    "                            <a href=\"#\">\n" +
                    "                                <img class=\"media-object\" style=\"width: 64px;height: 64px;\" src=\""+userDisOnlineList[i].imageLogo+"\">\n" +
                    "                            </a>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"media-body\">\n" +
                    "                            <h5 class=\"media-heading text-muted\">"+userDisOnlineList[i].nikeName+"</h5>\n" +
                    "                            <span class=\"text-muted\" style=\"font-size: 17px;color:red\">离线记录<span class=\"badge\" id=\"badege"+userDisOnlineList[i].id+"\" style=\"font-size:13px;\" >0</span></span>\n" +
                    "                    </div>"
                );
            }
        }

        if(onlineNumber<=0){
            $("#userOnlinePage").append("<h4 class='text-muted text-center' style='margin-top: 100px'>没有在线的好友喔</h4>");
        }else{


        for(var i=0;i<onlineNumber;i++){
            $("#userOnlinePage").append(
                "<div class=\"media\"  id=\""+userOnlineList[i].id+"\" style=\"width: 95%;margin-top: 20px;margin-left: 20px;cursor: pointer;border: 1px solid #e7e7e7;padding: 10px\" onclick='talk("+userOnlineList[i]+")' >\n" +
                "                        <div class=\"media-left\">\n" +
                "                            <a href=\"#\">\n" +
                "                                <img class=\"media-object\" style=\"width: 64px;height: 64px;\" src=\""+userOnlineList[i].imageLogo+"\">\n" +
                "                            </a>\n" +
                "                        </div>\n" +
                "                        <div class=\"media-body\">\n" +
                "                            <h5 class=\"media-heading text-muted\">"+userDisOnlineList[i].nikeName+"</h5>\n" +
                "                            <span class=\"text-muted\" style=\"font-size: 17px;color:red\">离线记录<span class=\"badge\" id=\"badege"+userOnlineList[i].id+"\" style=\"font-size:13px;\" >0</span></span>\n\n" +
                "                    </div>");
        }
        }
    }

    //更新上线用户列表
    function addOnlineUser(nikeName,imageLogo,userId){
        alert(nikeName+"上线！");
        if(onlineNumber<=0){
            $("#noPeopleOnlineFlag").remove();
        }
        var userInfo={};
        userInfo["nikeName"]=nikeName;
        userInfo["imageLogo"]=imageLogo;
        userInfo["userId"]=userId;
        //去除它不在线的列表
        $(userId).remove();
        var str="                   <div class=\"media\" id=\""+userId+"\" onclick='talk("+userInfo+")' style=\"width:95%;margin-top: 20px;margin-left: 20px;cursor: pointer;border: 1px solid #e7e7e7;padding: 10px\">\n" +
            "                        <div class=\"media-left\">\n" +
            "                            <a href=\"#\">\n" +
            "                                <img class=\"media-object\" style=\"width: 64px;height: 64px;\" src=\""+imageLogo+"\">\n" +
            "                            </a>\n" +
            "                        </div>\n" +
            "                        <div class=\"media-body\">\n" +
            "                            <h5 class=\"media-heading text-muted\">"+nikeName+"</h4>\n" +
            "                            <span class=\"text-muted\" style=\"font-size: 17px;color:red\">离线记录<span class=\"badge\" id=\"badege"+userId+"\" style=\"font-size:13px;\" >0</span></span>\n\n" +
            "                        </div>\n" +
            "                    </div>\n";
        $("#userOnlinePage").append(str);
    }

    //更新下线用户列表
    function removeOnlineUser(nikeName,imageLogo,userId){
        alert(nikeName+"下线！");
        var userInfo={};
        userInfo["nikeName"]=nikeName;
        userInfo["imageLogo"]=imageLogo;
        userInfo["userId"]=userId;
        $(userId).remove();
        var str="                    <div class=\"media\" onclick='talk("+userInfo+")' id='"+userId+"' style=\"width: 95%;margin-top: 20px;margin-left: 20px;cursor: pointer;border: 1px solid #e7e7e7;padding: 10px\">\n" +
            "                        <div class=\"media-left\">\n" +
            "                            <a href=\"#\">\n" +
            "                                <img class=\"media-object\" style=\"width: 64px;height: 64px;\" src=\""+imageLogo+"\">\n" +
            "                            </a>\n" +
            "                        </div>\n" +
            "                        <div class=\"media-body\">\n" +
            "                            <h5 class=\"media-heading text-muted\">"+nikeName+"</h4>\n" +
            "                            <span class=\"text-muted\" style=\"font-size: 17px;color:red\">离线记录<span class=\"badge\" id=\"badege"+userId+"\" style=\"font-size:13px;\" >0</span></span>\n\n" +
            "                        </div>\n" +
            "                    </div>\n";
        $("#userDisOnlinePage").append(str);
    }


    //发送消息
    function  sendMsg() {
        //检测是否已经连接到服务器
        if(websocket == null){
            alert("连接已被断开，请重新登入!");
            return;
        }

        var m = document.getElementById("chatMsg").value;
        if (m === "") {
            alert("请输入信息！");
            return;
        }

        var data={};
        //Json格式,键值对
        data["from"]=${sessionScope.userInfo.id};
        //发送给谁(id) -1代表全体好友
        data["to"]=parseInt(talkingUserId);
        //文本内容
        data["text"]=m;
        //发送人的昵称
        data["fromName"]=${sessionScope.userInfo.nikeName};
        //发送消息
        websocket.send(JSON.stringify(data));
        //添加自己发送的内容
            var str="    <div class=\"media\" style=\"margin-top: 10px\">\n" +
                "                    <div class=\"media-body\">\n" +
                "                        <h6 style=\"float: right\" class=\"media-heading text-muted\">\"+${sessionScope.userInfo.nikeName}+\"</h6>\n"+
                "                        <p  style=\"float:right;font-size: 20px;margin-top: 5px\" >"+m+"</p>\n" +
                "                    </div>\n" +
                "                    <div class=\"media-right\">\n" +
                "                        <a href=\"#\">\n" +
                "                            <img class=\"media-object\" style=\"width: 30px;height: 30px;\" src=\"\"+${sessionScope.userInfo.imageLogo}+\"\">\n" +
                "                        </a>\n" +
                "                    </div>\n" +
                "                </div>";
            $("#msgBox").append(str);
        //清空输入区域
            $("#chatMsg").val("");
    }

    //接受信息的处理流程
    function receiveMsg(v) {
        //检查是否是当前正在聊天的用户发的
        var from = v.from;
        if(from === talkingUserId){
        //拿到消息信息
        var text = v.text;
        console.log("recive msg",v);
        //更新msgBox显示
        var str="<div class=\"media\" style=\"margin-top: 10px\">\n" +
            "                <div class=\"media-left\">\n" +
            "                <a href=\"#\">\n" +
            "                   <img class=\"media-object\" style=\"width: 30px;height: 30px;\" src=\""+talkingImageLogo+"\">\n" +
            "                </a>\n" +
            "                </div>\n" +
            "                <div class=\"media-body\">\n" +
            "                <h6 class=\"media-heading text-muted\">"+talkingNikename+"</h6>\n" +
            "                <p style=\"font-size: 20px\">"+text+"</p>\n" +
            "                </div>\n" +
            "                </div>";
        $("#msgBox").append(str);
        }
        //如果不是，需要将消息加入数据库
        else{
            //利用ajax将消息内容放入数据库
            $.ajax({
                url:"/chat/saveTempMsg",
                type:"POST",
                data:{
                    //留言信息
                    tempMsg:v.text,
                    //本人的id
                    userId:${sessionScope.userInfo.id},
                    //朋友的id
                    friendId:v.from
                },
                dataType:"json"

            }).done(function(data){
                    alert(data.msg);
                }
            );
        }
    }

    function showUserChat() {
        alert(1);
    }
    function clear(){
        $("#chatMsg").val("");
    }

    //查询得到的用户列表
    var userInfos=[];
    function queryFriend() {
        //ajax请求服务器查找好友
        $.ajax({
            url:"/chat/queryFriend",
            type:"POST",
            data:{
                username:$("#searchFriendInput").val(),
                nikeName:$("#searchFriendInput").val()
            },
            dataType:"json"

        }).done(function(data){
            userInfos=data;
            if(userInfos.length>0){
                //遍历全部好友
                for(var q=0;q<userInfos.length;q++){
                    $("#modalBody").append(
                        "<div class=\"row\">\n" +
                        "                    <div class=\"media col-md-8\">\n" +
                        "                        <div class=\"media-left\">\n" +
                        "                            <a href=\"#\">\n" +
                        "                                <img class=\"media-object\" src='"+userInfos[q].imageLogo+"' style=\"width: 30px;height: 30px\" alt=\"用户头像\">\n" +
                        "                            </a>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"media-body\">\n" +
                        "                            <h4 class=\"media-heading\">昵称"+userInfos[q].nikeName+"</h4>\n" +
                        "                            <h5 class=\"text-muted\">用户账号"+userInfos[q].username+"</h5>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"col-md-3\">\n" +
                        "                        <button type=\"button\" class=\"btn btn-md btn-success\" onclick=\"addFriend()\">添加好友</button>\n" +
                        "                    </div>\n" +
                        "                </div>");
                }
                $("#addFriendModal").modal();
                return;

            }else{
                alert("未查到用户相关的信息");
                return;
            }
        }
        );
    }

    //i代表第几个查询的用户
    function addFriend(i){
        //ajax请求服务器查找好友
        $.ajax({
            url:"/chat/addFriend",
            type:"POST",
            data:{
                 userId:${sessionScope.userInfo.id},
                 friendId:userInfos[i].id
            },
            dataType:"json"

        }).done(function(data){
             alert(data.msg);
            //添加成功,重新利用ajax更新页面
             if(data.msg === "添加成功！"){
                 //添加成功后发送信息给websocket更新用户列表
                 //检测是否已经连接到服务器
                 if(websocket == null){
                     alert("连接已被断开，请重新登入!");
                     return;
                 }
                 var data1={};
                 //发送给谁(id) -1代表全体好友
                 data1["to"]=userInfos[i].id;
                 //添加好友
                 data1["msgType"]=3;
                 //发送消息
                 websocket.send(JSON.stringify(data1));
             }
        });
    }
</script>
<style>
    body{
        background:white;
    }
    a{
        color:#6c6c6c;
    }

</style>
<body>
<section id="navbarSection">
    <nav class="navbar navbar-inverse navbar-fixed-top">
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

                    <li><a href="#" style="color:white">消息</a></li>
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

<div id="chatSection" style="margin-top: 52px">

    <div class="row">
        <div  style="border:1px solid #e7e7e7;font-weight: bold" class="col-md-3 text-center text-muted">
            <h3>用户列表</h3>
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#userOnlinePage" aria-controls="home" role="tab" data-toggle="tab">在线用户<span class="badge" id="userOnlineNumber"></span> </a></li>
                <li role="presentation"><a href="#userDisOnlinePage" aria-controls="profile" role="tab" data-toggle="tab">不在线用户<span class="badge" id="userDisOnlineNumber"></span> </a></li>
            </ul>
        </div>
        <div  style="margin-top:50px;font-weight: bold ;font-size: 21px" class="col-md-9 text-muted">
            <div class="row">
                <div class="col-md-3">聊天窗口<span id="curNikeName"></span></div>
                <div class="col-md-6 col-md-offset-2">
                    <div class="input-group">
                        <input type="text" id="searchFriendInput" class="form-control" placeholder="请输入好友的昵称或账号id">
                        <span class="input-group-btn">
                            <button id="searchBtn" onclick="queryFriend()" class="btn btn-success" type="button">查询好友</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3" style="overflow: scroll;height: 650px">
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane  fade in active" id="userOnlinePage">
                </div>
                <div role="tabpanel" class="tab-pane fade" id="userDisOnlinePage">
                </div>
            </div>
        </div>

        <div class="col-md-9"  style="border-top: 1px solid #e3d2d2;overflow-y:auto;height: 700px;"  >
            <div style="height: 450px;overflow-y: auto" id="msgBox" class="col-md-11">
            </div>
            <div id="editBox" style="height:199px;border-top: 1px solid #ededed;padding: 5px">
                <textarea id="chatMsg" style="color:black;background: #e7e7e7;font-size: 17px;border: none;padding: 10px" autofocus="autofocus" cols="95" rows="6" placeholder="在此处输入消息"></textarea>
                <div>
                    <button type="button" class= "btn btn-success btn-md text-center" onclick=" clear()" style="margin-left: 650px;width: 100px">清空消息</button>
                    <button type="button" class="btn btn-primary btn-md text-center" onclick="sendMsg()" style="width: 100px">发送消息</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--添加好友模态框--%>
<div class="modal fade" id="addFriendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addFriendModalLabel">选择好友界面</h4>
            </div>
            <div class="modal-body" id="modalBody">

            </div>
        </div>
    </div>
</div>
</body>
</html>