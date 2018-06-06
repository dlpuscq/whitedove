<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码 | 小白鸽</title>
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
            <p class="lbg-txt">填写注册邮箱</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>2</i></span> <span class="line_bg lbg-l"></span> <span class="line_bg lbg-r"></span>
            <p class="lbg-txt">验证邮箱信息</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>3</i></span> <span class="line_bg lbg-l"></span>
            <p class="lbg-txt">找回密码成功</p>
          </li>
        </ul>
      </div>
      <div class="reg-box retrieve-psw" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
          <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>电子邮箱：</span>
            <div class="f-fl item-ifo">
              <input type="text" name="email" class="txt03 f-r3 required btn_Pswpart1" keycodes="mail" tabindex="2" data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"  id="mail" />
              <span class="ie8 icon-close close hide"></span>
              <label class="icon-sucessfill blank hide"></label>
              <label class="focus">请填写正确格式的电子邮箱</label>
              <label class="focus valid"></label>
            </div>
          </div>
          <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
            <div class="f-fl item-ifo">
              <input type="text" name="registerCode" maxlength="4" class="txt03 f-r3 f-fl required btn_Pswpart1" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" />
              <span class="ie8 icon-close close hide"></span>
              <label class="f-size12 c-999 f-fl f-pl10">
                <img src="${ctx }/public/image/validateImg"
                     onclick="this.src='${ctx }/public/image/validateImg?d='+Math.random();" id="checkCode"/> </label>
                <label class="focus valid" style="left:370px"></label>
            </div>
          </div>
          <div class="item col-xs-12 message" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
            <label class="valid" ></label>
          </div>
          <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
            <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_Pswpart1">找回密码</a> </div>
          </div>
        </div>
        <div class="part2" style="display:none">
            <input hidden="true" id="checkchange">
          <div class="alert alert-info" style="width:700px">点击"发送验证码"，发送邮件至您电子邮箱，输入邮箱中的验证码，确保您的电子邮箱真实有效。</div>
          <div class="item col-xs-12 f-mb30 f-mt10" style="height:auto">
              <span class="intelligent-label f-fl">电子邮箱：</span>
            <div class="f-fl item-ifo c-blue"> </div>
          </div>
          <div class="item col-xs-12" > <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
            <div class="f-fl item-ifo">
              <input type="text" maxlength="6" id="verifyNo" class="txt03 f-r3 f-fl required btn_Pswpart2" tabindex="4" style="width:167px" data-valid="isNonEmpty" data-error="验证码不能为空" />
              <span class="btn btn-gray f-r3 f-ml5 f-size13" id="time_box" disabled style="width:97px;display:none;">发送验证码</span>
              <span class="btn btn-gray f-r3 f-ml5 f-size13" id="verifyYz"  style="width:97px;" data-emailSign="">
                  发送验证码</span> <span class="ie8 icon-close close hide" style="right:130px"></span>
              <label class="icon-sucessfill blank hide"></label>
              <label class="focus"><span>请查收电子邮箱邮件，并填写邮件中的验证码</span></label>
              <label class="focus valid"></label>
            </div>
          </div>
          <div class="item col-xs-12 message" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
            <label class="valid" ></label>
          </div>
          <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
            <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_Pswpart2">提交</a> </div>
          </div>
        </div>
        <div class="part3" style="display:none">
          <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
            <div class="f-fl item-ifo">
              <input type="password" name="loginPassword" id="password" maxlength="20" class="txt03 f-r3 required btn_Pswpart3" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
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
              <input type="password"  name="reloginPassword" maxlength="20" class="txt03 f-r3 required btn_Pswpart3" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
              <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="rePassword"></span>
              <label class="icon-sucessfill blank hide"></label>
              <label class="focus">请再输入一遍上面的密码</label>
              <label class="focus valid"></label>
            </div>
          </div>
          <div class="item col-xs-12 message" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
            <label class="valid" ></label>
          </div>
          <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
            <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_Pswpart3">确定</a> </div>
          </div>
        </div>
        <div class="part4 text-center" style="display:none">
          <h3></h3>
          <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="${ctx}/login" class="c-blue">登陆界面</a></p>
        </div>
        <div class="item col-xs-12" style="height:auto">
            <div class="lines" ></div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="footer clear">
  <div class="footer_copyright"> © 2018 小白鸽培训机构 </a>/ <span id="showsectime"></span> / <span id="TimeShow"></span> </div>
</footer>
</body>
</html>