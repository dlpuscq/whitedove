<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>
        就业名企
    </title>
</head>
<body>
<jsp:include page="top.jsp"/>
<div class="container layout-hasside layout-margin-top">
    <div class="sub-menu">
        <a class="" href="courses.html">
            <i class="fa fa-th">
            </i>
            全部课程
        </a>
        <a class="active" href="companys.html">
            <i class="fa fa-th-large">
            </i>
            职业方向
        </a>
    </div>
    <div class="row">
        <div class="col-md-9 layout-body">
            <div class="content">
                <div class="row">
                    <c:forEach items="${tbCareer}" var="career">
                    <div class="col-sm-3">
                        <a class="learn-path-item">
                            <img src="${career.img}">
                            <div class="learn-path-name">
                                    ${career.career}
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="right.jsp"/>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>