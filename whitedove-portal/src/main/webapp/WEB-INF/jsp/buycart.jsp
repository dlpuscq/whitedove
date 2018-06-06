<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="common/buy-success.css">
    <link rel="stylesheet" href="common/base.css">
    <link rel="stylesheet" href="common/goods-detail.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="o-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>
        购物车
    </title>
</head>
<body  style="background-color: whitesmoke">
<jsp:include page="top.jsp"/>
<div class="container layout-hasside layout-margin-top">
                <br>
            <div class="buy-succ-box clearfix" >
                <div class="goods-content" >
                    <div class="goods-img">
                        <a href="#">
                            <img src="${itemList.image}" width="180" height="110">
                        </a>
                    </div>

                    <div class="goods-info">
                        <span class="name">
                      ${itemList.title}
                         </span>
                        <br>
                        <h3>已成功加入购物车！</h3>
                    </div>
                </div>
                <div class="actions"> <a href="${ctx}/courses" class="btn btn-line-gray" >继续购物</a> <a href="${ctx}/buycartlist" class="btn btn-primary">去购物车结算</a> </div>
            </div>

</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>