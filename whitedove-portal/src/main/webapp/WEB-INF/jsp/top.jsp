<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <script type="text/javascript">

        $(function(){
            // 查看是否已经登录，如果已经登录查询登录信息
            wd.checkLogin();
        });

        var wd = {
            checkLogin : function(){
                var _ticket = $.cookie("W_TOKEN");
                var num = $.cookie("Cartnum");
                if(!_ticket){
                    return ;
                }
                $.ajax({
                    url : "http://localhost:8083/token/" + _ticket,
                    dataType : "jsonp",
                    type : "GET",
                    success : function(data){
                        if(data.status == 200){
                            var username = data.data.username;
                            var html = "<ul class=\"nav navbar-nav\">\n" +
                                "           \n" +
                                "                <li class=\"dropdown \">\n" +
                                "                    <a href=\"javascript:void(0);\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                                "                        "+username+" <span class=\"caret\"></span>\n" +
                                "                    </a>\n" +
                                "                    <ul class=\"dropdown-menu\">\n" +
                                "                        <li class=\"\"><a href=\"${ctx}/myorder\">订单中心</a></li>\n" +
                                "                        <li class=\"\"><a href=\"${ctx}/mycourses\">个人中心</a></li>\n" +
                                "                        <li class=\"\"><a href=\"${ctx}/logout\">退出登录</a></li>\n" +
                                "                    </ul>\n" +
                                "                </li>\n" +
                                "                  <li class=\"\">\n" +
                                "                    <a href=\"buycartlist\"><i class=\"glyphicon glyphicon-shopping-cart\"></i>购物车("+num+")</a>\n" +
                                "                  </li>\n" +
                                "            </ul>"
                            $("#loginbar").html(html);
                            if (username!=null){
                                $("#cfu1").hide();
                                $("#rightlogin").hide();
                                $("#cfu2").show();
                            }
                            document.getElementById('hiddename').value = username;
                        }
                    }
                });


            }
        }

        function x(u){
            var x = document.getElementById(u).value;
            var b = "http://localhost:8081/search?q=" + encodeURIComponent(x);
            return window.location.href =b;
        }

        function onblurs(){
            if(document.getElementById("key").value==""){
                document.getElementById("key").value ="推荐课程" ;
            }
        }
    </script>
   <style>
    #search-btn {
      width: 35px;
     height: 35px;
     text-align: center;
      padding: 5px 0%;
      font-size: 12px;
     line-height: 1.428571429;
     border-radius: 20px;
    }
   </style>
    <script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<meta charset="utf-8">
	<nav class="navbar navbar-default navbar-fixed-top home-header" style="background-color: white">
        <input type="hidden" id="hiddename" name="hiddename"/>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar-collapse" aria-expanded="false">
                <span class="sr-only">小白鸽</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="header-navbar-collapse">
            <ul class="nav navbar-nav">
                  <li class="active">
                    <a href="/">小白鸽</a>
                </li>
                <li class="dropdown ">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        课程 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class=""><a href="courses">全部课程</a></li>
                        <li class=""><a href="companys">职业方向</a></li>
                    </ul>
                </li>
                  <li class="">
                    <a href="teachers">优秀教师</a>
                  </li>
            </ul>


            <ul class="nav navbar-nav navbar-right header-sign" id="loginbar">
                <li><a class="sign-in" data-sign="signin" href="http://localhost:8083/login">登录</a></li>
                <li><a class="sign-up" data-sign="signup" href="http://localhost:8083/register">注册</a></li>
            </ul>

            <div class="navbar-form navbar-right">
                <div data-v-72bea96c="" class="form-group">
                    <input class="form-control" id="key" name="key" type="text"  onblur="onblurs()" placeholder="搜索 课程"/>
                    <button type="button" class="btn btn-default btn-circle" id="search-btn" onclick="x('key')" value="推荐课程" >
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
            </div>

        </div>
    </div>
    </nav>
</div>
