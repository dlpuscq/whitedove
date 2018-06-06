<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>账户注册 | 小白鸽</title>

    <script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="${ctxsta}/os/user/js/canvas-nest.min.js"></script>
<div class="login-box">
  <div class="container-nav"> <a class="navbar-brand" href="http://localhost:8081">小白鸽培训机构</a>
    <ul class="navbar-nav-right">
      <li class="link-line">|</li>
      <li><a href="${ctx}/login">登录</a></li>
      <li><a href="${ctx}/register">注册</a></li>
    </ul>
  </div>
  <div class="main">
    <div class="reg-box-pan display-inline">
      <div class="reg-box login" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
          <form>
            <div class="item col-xs-12">
              <div class="f-fl item-ifo">
                <input type="text" name="username" maxlength="20" placeholder="用户名" class="txt03 f-r3 required loginPage" tabindex="1" data-valid="isNonEmpty" data-error="请输入账号" id="adminNo" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus"><span></span></label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12">
              <div class="f-fl item-ifo">
                <input type="password" name="password" id="password" maxlength="20" placeholder="密码" class="txt03 f-r3 required loginPage" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty" data-error="密码不能为空" data-exponent="${publicKeyMap.exponent}" data-modulus="${publicKeyMap.modulus}"/>
                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus"></label>
                <label class="focus valid"></label>
                <span class="clearfix"></span>
                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
              </div>
            </div>
              <div class="item col-xs-12">
                  <div class="f-fl item-ifo">
                      <input type="text" name="randcode" maxlength="4" placeholder="验证码" class="txt03 f-r3 f-fl required btn_part1" tabindex="4" style="width:167px" id="randcode" data-valid="isNonEmpty" data-error="验证码不能为空" />
                      <span class="ie8 icon-close close hide"></span>
                      <label class="f-size12 c-999 f-fl f-pl10">
                          <img src="${ctx }/public/image/validateImg"
                               onclick="this.src='${ctx }/public/image/validateImg?d='+Math.random();" id="checkCode"/> </label>
                      <label class="focus valid" style="left:370px"></label>
                  </div>
              </div>
          </form>
          <div class="item col-xs-12 message" style="height:auto">
            <label class="valid" ></label>
          </div>
          <div class="item col-xs-12">
            <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_login">立即登录</a> </div>
          </div>
          <div class="item col-xs-12" style="height:auto">
            <label class="valid  line" ><a href="${ctx}/forgetPassword">忘记密码？</a></label>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="footer clear">
  <div class="footer_copyright"> © 2018 小白鸽培训机构 </a>/ <span id="showsectime"></span> / <span id="TimeShow"></span> </div>
</footer>
<script type="text/javascript">
    var redirectUrl = "${redirect}";
    /**
     * 登陆页面按钮栏控制
     */
    $(function() {
        $("#btn_login").click(function() {
            if (!verifyCheck._click()) return;
            var loginPassword = $("#password").val();
            var loginName = $("input[name='username']").val();
            var randcode = $("input[name='randcode']").val();
            $.ajax({
                type : "POST",
                url : baselocation + '/userlogin',
                data : {
                    "username" : loginName,
                    "password" : loginPassword,
                    "randcode" : randcode
                },
                dataType : "json",
                success : function(result) {
                    if (result.status == 200) {
                        $(".message").hide();
                        if (redirectUrl == "") {
                            window.location.href = 'http://localhost:8081';
                        } else {
                            window.location.href = redirectUrl;
                        }

                    } else {
                        $(".message").show();
                        $(".message").children("label").text(result.msg);
                    }
                }
            })
        });
    });

</script>
</body>
</html>
