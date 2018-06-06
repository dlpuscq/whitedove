<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>账户注册 | 小白鸽</title>
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
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
      <div class="step">
        <ul>
          <li class="col-xs-4 on"> <span class="num"><em class="f-r5"></em><i>1</i></span> <span class="line_bg lbg-r"></span>
            <p class="lbg-txt">填写账户信息</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>2</i></span> <span class="line_bg lbg-l"></span> <span class="line_bg lbg-r"></span>
            <p class="lbg-txt">验证账户信息</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>3</i></span> <span class="line_bg lbg-l"></span>
            <p class="lbg-txt">注册成功</p>
          </li>
        </ul>
      </div>
      <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
          <form method="post" id="verifyUser">
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>昵称：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="username" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" id="adminNo" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号码：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="phone" class="txt03 f-r3 required btn_part3" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请填写11位有效的手机号码</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>电子邮箱：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="email" class="txt03 f-r3 required btn_Pswpart1" keycodes="mail" tabindex="2" data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"  id="mail" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请填写正确格式的电子邮箱</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
              <div class="f-fl item-ifo">
                <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                <label class="focus valid"></label>
                <span class="clearfix"></span>
                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
              <div class="f-fl item-ifo">
                <input type="password"  maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="rePassword"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请再输入一遍上面的密码</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="registerCode" maxlength="4" class="txt03 f-r3 f-fl required btn_part1" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" />
                <span class="ie8 icon-close close hide"></span>
                <label class="f-size12 c-999 f-fl f-pl10">
                  <img src="${ctx }/public/image/validateImg"
                       onclick="this.src='${ctx }/public/image/validateImg?d='+Math.random();" id="checkCode"/> </label>
                <label class="focus valid" style="left:280px"></label>
              </div>
            </div>
            <div class="message item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <label class="valid"></label>
            </div>
            <div class="item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款">
                <input type="checkbox"  checked />
                <a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a> </p>
              <label class="focus valid"></label>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
              <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a> </div>
            </div>
          </form>
        </div>
        <div class="part4 text-center" style="display:none">
          <h3></h3>
          <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="${ctx}/login.html" class="c-blue">登陆界面</a></p>
        </div>
        <div class="item col-xs-12" style="height:auto">
            <div class="lines" ></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
  <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
  <div class="apply_up_content">
    <pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
  </div>
  <center>
    <a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a>
  </center>
</div>
<footer class="footer clear">
  <div class="footer_copyright"> © 2018 小白鸽培训机构 </a>/ <span id="showsectime"></span> / <span id="TimeShow"></span> </div>
</footer>
</body>
</html>