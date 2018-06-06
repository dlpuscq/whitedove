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
        个人信息修改
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
                        <h3 class="title">个人信息修改</h3>
                        <div class="portal-main clearfix">
                            <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                                <div class="part1">
                                    <form method="post" id="verifyUser">
                                        <div class="item col-xs-12">
                                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>头像：</span>
                                            <div id="preview">
                                                <img id="imghead" class="headimg" border="0" src="${user.headpic}" width="50" height="50" onClick="$('#picfile').click();">
                                            </div>
                                            <input type="file" onChange="previewImage(this)" style="display: none;" id="picfile" name="picfile">
                                            <input class="text"  type="hidden" name="headPichide" id="headPichide" value="${user.headpic}">
                                            <input class="text"  type="hidden" name="username" id="username" value="${user.username}">
                                        </div>
                                        <br>
                                        <div class="item col-xs-12">
                                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                                            <div class="">
                                                ${user.username}
                                            </div>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号码：</span>
                                            <div class="f-fl item-ifo">
                                                <input type="text" name="phone" class="txt03 f-r3 required btn_part3" value="${user.phone}" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" />
                                                <span class="ie8 icon-close close hide"></span>
                                                <label class="icon-sucessfill blank hide"></label>
                                                <label class="focus hide" >请填写11位有效的手机号码</label>
                                                <label class="focus valid"></label>
                                            </div>
                                        </div>
                                        <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>电子邮箱：</span>
                                            <div class="f-fl item-ifo">
                                                <input type="text" name="email" class="txt03 f-r3 required btn_Pswpart1"  value="${user.email}" keycodes="mail" tabindex="2" data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"  id="mail" />
                                                <span class="ie8 icon-close close hide"></span>
                                                <label class="icon-sucessfill blank hide"></label>
                                                <label class="focus hide">请填写正确格式的电子邮箱</label>
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
</div>
<jsp:include page="bottom.jsp"/>
</body>
<script>

    //图片上传预览  IE是用了滤镜。
    function previewImage(file)
    {
        var MAXWIDTH  = 50;
        var MAXHEIGHT = 50;
        var div = document.getElementById('preview');
        $.ajaxFileUpload({
                url : '/headpic/upload',
                secureuri : false,
                fileElementId : 'picfile',
                dataType : 'json',
                success : function(data) {
                    document.getElementById("headPichide").value = data.url;
                    countdown({
                        maxTime : 5,
                        ing : function(c) {
                            $(".message").show();
                            $(".message").children("label").text(data.message);
                        },
                        after : function() {
                            $(".message").hide();
                        }
                    });
                }
            });

        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead onclick=$("#picfile").click()>';
            var img = document.getElementById('imghead');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
    }

    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight ){
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight ){
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else{
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

    //保存修改信息
    $(function() {
        $("#btn_part1").click(function() {
            if (!verifyCheck._click()){
                return;
            }
            var params = '';
            $("#verifyUser input").each(function() {
                params += $(this).serialize() + "&";
            });
            $.ajax({
                type : "POST",
                url : baselocation + '/saveuser',
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
                                window.location.href = '/mine'
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