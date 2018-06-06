<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Lei Shi">
<meta http-equiv="Cache-Control" content="o-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<title>小白鸽培训网站</title>
</head>
<body style="background-color: white">
	<jsp:include page="top.jsp"></jsp:include>
	<div class="layout layout-margin-top layout-fullscreen">
		<div class="carousel slide" id="carousel-generic" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="images/home_banner.jpg">
				</div>
				<div class="item">
					<a href="https://www.shiyanlou.comcontests.htmllou6"
						target="_blank"> <img src="images/home_banner_2.jpg">
					</a>
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">上一个</span>
			</a> <a class="right carousel-control" href="#carousel-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">下一个</span>
			</a>
		</div>
		<div class="home-section recommend-courses">
			<div class="container">
				<div class="home-section-header">
					<div class="home-section-title">职业方向</div>
					<div class="home-section-desc">Career direction</div>
				</div>
				<div class="row learn-path-body">

				<c:forEach items="${tbCareer}" var="career">
					<div class="col-sm-2">
						<a class="learn-path-item"> <img
							src="${career.img}">
							<div class="learn-path-name">${career.career}</div>
						</a>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<div class="home-section recommend-courses">
			<div class="container">
				<div class="home-section-header">
					<div class="home-section-title">名师阵容</div>
					<div class="home-section-desc">具有多年产业背景与研发经验的实战讲师团</div>
				</div>
                <div class="row learn-path-body">
                    <c:forEach items="${teachers}" var="teachers">
                        <div class="col-sm-2">
                            <a class="learn-path-item">
                                <img src="${teachers.pic}">
                                <div class="learn-path-name">${teachers.teacherName}</div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
			</div>
		</div>
		<div class="home-section recommend-courses">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<a><img src="images/introducecontainer1.gif"></a>
						<div class="home-features-text">丰富全面的计算机实验课程</div>
					</div>
					<div class="col-sm-3">
						<a><img src="images/introducecontainer2.gif"></a>
						<div class="home-features-text">完善的编程环境</div>
					</div>
					<div class="col-sm-3">
						<a><img src="images/introducecontainer3.gif" /></a>
						<div class="home-features-text">每天一个项目课，丰富你的项目经验</div>
					</div>
					<div class="col-sm-3">
						<a><img src="images/introducecontainer4.gif" /></a>
						<div class="home-features-text">有效学习时间，真实记录你的代码生涯</div>
					</div>
				</div>
				<div class="home-section-footer home-features-footer">
					<a class="home-courses-btn" href="courses">开始学习</a>
				</div>
			</div>
		</div>
	</div>
    <jsp:include page="bottom.jsp"/>
</body>
</html>
