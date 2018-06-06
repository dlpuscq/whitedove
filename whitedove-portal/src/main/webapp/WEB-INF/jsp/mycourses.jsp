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
        我的订单
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
                <div class="uc-content-box order-list-box">
                    <div class="box-hd">
                        <h1 class="title">我的课程</h1>
                        <div class="more clearfix">
                            <ul class="filter-list J_orderType">
                                <li class="first ${flag eq 1 ? 'active':''}">
                                    <a href="${ctx}/mycourses?status=1" data-type="1">已购买课程</a>
                                </li>
                                <li class="${flag eq 2 ? 'active':''}">
                                    <a id="J_unpaidTab" href="${ctx}/mycourses?status=2" data-type="2">已收藏课程</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-bd">
                        <div class="row">
                            <c:forEach items="${myItemList}" var="item">
                                <div class="col-md-3 col-sm-4  course">
                                    <a class="course-box" href="coursesdetail?id=${item.itemId}">
                                        <div class="course-img">
                                            <img src="${item.itemPic}">
                                        </div>
                                        <div class="course-body">
                                            <div class="course-name">
                                                    ${item.itemName}
                                            </div>
                                            <div class="course-desc">
                                                    ${item.itemTitle}
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
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