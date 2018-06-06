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
    <link rel="stylesheet" href="common/base.css">
    <link rel="stylesheet" href="common/main.css">
    <link rel="stylesheet" href="common/cart.css">
    <title>
        个人信息
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
                    <div class="portal-main clearfix">
                        <div class="user-card">
                            <h2 class="username">${user.username}</h2>
                            <p class="tip">你好</p>
                            <a class="link" href="/mymessage">修改个人信息 &gt;</a> <img class="avatar" src="${user.headpic}" width="160" height="160" alt="${user.username}"> </div>
                        <div class="user-actions">
                            <ul class="action-list">
                                <li>账户安全：<span class="level level-3">较高</span></li>
                                <li>绑定邮箱：<span class="user-email">${user.email}</span></li>
                                <li>绑定手机：<span class="tel">${user.phone}</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="portal-sub">
                        <ul class="info-list clearfix">
                            <li>
                                <h3>待支付的订单：<span class="num">${s1}</span></h3>
                                <a href="${ctx}/myorder?status=1">查看待支付订单&nbsp;
                                    <i class="glyphicon glyphicon-chevron-right"></i></a> <img src="images/portal-icon-1.png" alt=""> </li>
                            <li>
                                <h3>已取消的订单：<span class="num">${s0}</span></h3>
                                <a href="${ctx}/myorder?status=0">查看已取消订单&nbsp;
                                    <i class="glyphicon glyphicon-chevron-right"></i></a> <img src="images/portal-icon-3.png" alt=""> </li>
                        </ul>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>