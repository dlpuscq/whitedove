<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">s">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <script src="common/user/js/register.js"></script>
    <link rel="stylesheet" href="common/base.css">
    <link rel="stylesheet" href="common/main.css">
    <link rel="stylesheet" href="common/cart.css">
    <link rel="stylesheet" href="common/user/css/gloab.css" />
    <link rel="stylesheet" href="common/user/css/index.css" />
    <title>
        密码修改
    </title>
    <style type="text/css">
        html{     width:100%;    overflow-x:hidden;}
    </style>
</head>
<body style="background-color: whitesmoke">
<jsp:include page="top.jsp"/>
<div class="layout layout-margin-top layout-fullscreen">
    <div class="row">
        <div class="span1">
        </div>
        <jsp:include page="left.jsp"/>
        <div class="span16">
            <div class="uc-box uc-main-box">
                <div class="uc-content-box portal-content-box">
                    <div class="box-bd">
                        <h3 class="title">修改密码</h3>
                        <div class="portal-main clearfix">
                            <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                                <div class="part1">
                                    <form method="post" id="verifyUser">
                                        <div class="item col-xs-12">
                                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                                            <div class="">
                                                ${user.username}
                                            </div>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>旧密码：</span>
                                            <div class="f-fl item-ifo">
                                                <input type="password" name="oldpassword" id="oldpassword" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||密码太简单" />
                                                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                                                <label class="icon-sucessfill blank hide"></label>
                                                <label class="focus hide">请输入旧密码</label>
                                                <label class="focus valid"></label>
                                                <span class="clearfix"></span>
                                                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
                                            </div>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>新密码：</span>
                                            <div class="f-fl item-ifo">
                                                <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                                                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                                                <label class="icon-sucessfill blank hide"></label>
                                                <label class="focus hide">输入新密码</label>
                                                <label class="focus valid"></label>
                                                <span class="clearfix"></span>
                                                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
                                            </div>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                                            <div class="f-fl item-ifo">
                                                <input type="password"  maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" name="rePassword" />
                                                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="rePassword"></span>
                                                <label class="icon-sucessfill blank hide"></label>
                                                <label class="focus hide">请再输入一遍上面的密码</label>
                                                <label class="focus valid"></label>
                                            </div>
                                        </div>
                                        <div class="message item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
                                            <label class="valid"></label>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
                                            <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">保存</a> </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
</body>
<script>

    $(function() {
        $("#btn_part1").click(function() {
            if (!verifyCheck._click()){
                return;
            }
            var params = '';
            $("#verifyUser input").each(function() {
                params += $(this).serialize() + "&";
            });
            console.log(params);
            $.ajax({
                type : "POST",
                url : baselocation + '/savepwd',
                data : params,
                dataType : "json",
                success : function(result) {
                    if (result.status == 200) {
                        countdown({
                            maxTime : 2,
                            ing : function(c) {
                                $(".message").show();
                                $(".message").children("label").text(result.data);
                            },
                            after : function() {
                                $(".message").hide();
                                window.location.href = '/logout'
                            }
                        });
                    } else {
                        countdown({
                            maxTime : 5,
                            ing : function(c) {
                                $(".message").show();
                                $(".message").children("label").text(result.msg);
                            },
                            after : function() {
                                $(".message").hide();
                            }
                        });
                    }
                }
            })
        });
    });

    //倒计时插件
    (function($) {
        var timerT,
            timerC,
            opt;
        var countdown = function(config) {
            config = $.extend(require.defaults, config || {});
            opt = config;
            countdown._clear();
            return (new require())._init();
        };
        function require(options) {
        }
        ;
        require.prototype = {
            _init : function() {
                timerC = opt.maxTime;
                this._sendVerify();
            },
            _sendVerify : function() {
                var that = this;
                if (timerC === 0) {
                    countdown._clear();
                    opt.after();
                    timerC = opt.maxTime;
                    return;
                }
                timerC--;
                opt.ing(timerC);
                timerT = setTimeout(function() {
                    that._sendVerify();
                }, 1000);
            }
        };
        countdown._clear = function() {
            clearTimeout(timerT);
        };
        require.defaults = {
            maxTime : 60, //倒计时最大值
            minTime : 0, //倒计时最小值
            ing : function(c) {}, //每倒计时一秒返回函数
            after : function() {} //倒计时结束后返回函数
        };
        window.countdown = $.countdown = countdown;
    })(jQuery);
</script>
</html>