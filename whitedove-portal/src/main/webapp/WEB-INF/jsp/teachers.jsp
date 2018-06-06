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
<body  style="background-color: whitesmoke" >
<jsp:include page="top.jsp" />
	<div class="laboratory-teachers-con layout-fullscreen">
		<div class="container">
			</br>
			<div class="row">
				<div class="laboratory-teachers-header"></div>
			</div>
			<div class="row laboratory-tea-panel" style="background-color: whitesmoke">
            <c:forEach items="${teachers}" var="u">
				<div class="col-md-4">
					<a href="/teacher?id=${u.teacherId}&cid=${u.catId}">
						<div class="laboratory-box">
							<div class="col-md-6">
								<img class="headimg" src="${u.pic}" />
							</div>
							<div class="col-md-6 top-13">
								<p>
									<span class="tecname">${u.teacherName}</span>&nbsp; <span class="tectitle"></span>
								</p>
								<p>
									<span class="tecnschool">${u.titleDesc}</span>
								</p>
								<p>
									<span class="coursenum">查看已发布课程
									</span>
								</p>
							</div>
						</div>
					</a>
				</div>
             </c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"/>
</body>
</html>

