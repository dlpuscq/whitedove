<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Lei Shi">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>小白鸽名师</title>
</head>
<body>
<jsp:include page="top.jsp" />
<div class="container layout-margin-top layout-noside">
    <div class="row">
        <div class="col-md-12 layout-body">

            <div class="userinfo-banner container">
                <div class="banner-container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left userinfo-banner-avatar">
                                <div class="user-avatar ">
                                    <a class="avatar" href="#">
                                        <img src="${teacher.pic}">
                                    </a>
                                </div>
                            </div>
                            <div class="pull-left userinfo-banner-details">
                                <div class="userinfo-banner-meta">
                                    <span>${teacher.teacherName}</span>
                                </div>
                                <hr>
                                <div class="userinfo-banner-status">
                                   ${teacher.titleDesc}
                                </div>
                                <p>
									<span class="coursenum">已发布 <span
                                            style="color: #eb6877; font-weight: bold;">
											&nbsp;${itemNum}&nbsp; </span> 门课程
									</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container layout">
                <div class="row">
                    <div class="col-md-9 layout-body">
                        <div class="content">
                            <ul class="nav nav-tabs" rolw="tablist">
                                <li role="presentation" class="active">
                                    <a href="#" role="tab">所教学科</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active">
                                    <div class="row">
                                    <c:forEach items="${items}" var="u">
                                        <div class="col-md-4 col-sm-6  course">
                                            <a class="course-box" href="coursesdetail?id=${u.id}&cid=${u.cid}">
                                                <div class="course-img">
                                                    <img alt="${u.title}" src="${u.images[0]}">
                                                </div>
                                                <div class="course-body">
                                                    <div class="course-name">${u.title}</div>
                                                    <div class="course-desc">${u.sellPoint}</div>
                                                    <div class="course-footer">
                                                       <span class="course-per-num pull-left">
                                                          <i class="fa fa-bars"></i>
                                                            <i>价格：</i>
                                                            <strong>￥<fmt:formatNumber groupingUsed="false" maxFractionDigits="2"
                                                                                       minFractionDigits="2" value="${u.price / 100 }"/></strong>
                                                        </span>
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
                    <div class="col-md-3 layout-side">
                        <div class="sidebox user-visitors">
                            <div class="sidebox-header">
                                <h4 class="sidebox-title">其他课程</h4>
                            </div>
                            <div class="sidebox-body">
                            <c:forEach items="${itemten}" var="itemten">
                                <div class="col-dm-12">
                                    <a class="row" href="coursesdetail?id=${itemten.id}&cid=${itemten.cid}">
                                        <div class="col-xs-2">
                                            <img src="${itemten.images[0]}">
                                        </div>
                                        <div class="col-xs-10">
                                            <div>${itemten.title}</div>
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
</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>
