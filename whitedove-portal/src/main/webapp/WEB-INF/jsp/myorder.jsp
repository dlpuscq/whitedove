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
    <script src="common/layer/layer.js"></script>
    <link rel="stylesheet" href="common/base.css">
    <link rel="stylesheet" href="common/main.css">
    <link rel="stylesheet" href="common/cart.css">
    <link rel="stylesheet" href="common/order-confirm.css">
    <title>
        我的订单
    </title>
    <style type="text/css">
        html{     width:100%;    overflow-x:hidden;}
    </style>
</head>
<body style="background-color: whitesmoke">
<jsp:include page="top.jsp"/>
<div class="layout layout-margin-top layout-fullscreen" >
    <div class="row">
        <div class="span1">
        </div>
        <jsp:include page="left.jsp"/>
        <div class="span16">
        <div class="uc-box uc-main-box">
            <div class="uc-content-box order-list-box">
                <div class="box-hd">
                    <h1 class="title">我的订单</h1>
                    <div class="more clearfix">
                        <ul class="filter-list J_orderType">
                            <li class="first ${type eq 1 ? 'active':''}"><a href="${ctx}/myorder?status=1" data-type="1">全部有效订单</a></li>
                            <li class="${type eq 1 ? 'active':''}"><a id="J_unpaidTab" href="${ctx}/myorder?status=1" data-type="1">待支付</a></li>
                            <li class="${type eq 0 ? 'active':''}"><a id="J_sendTab" href="${ctx}/myorder?status=0" data-type="0">已关闭</a></li>
                        </ul>
                    </div>
                </div>
                <div class="box-bd">
                    <div id="J_orderList">
                        <ul class="order-list">
                            <c:forEach items="${orderList}" var="order">
                                <c:if test="${type eq 1}">
                                    <li class="uc-order-item uc-order-item-pay">
                                        <div class="">
                                            <div class="order-summary">
                                                <div class="order-status">等待付款</div>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main">
                                                        <p class="caption-info">
                                                            <fmt:formatDate value="${order.created}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">|</span>${order.username}<span class="sep">|</span>订单号：${order.orderId}</a>
                                                        </p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${order.totalFee}</span>元</p>
                                                        <input hidden="true" id="hidorderid" value="${order.orderId}"/>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items">
                                                        <ul class="goods-list">
                                                        <c:forEach items="${order.orderItems}" var="orderItem">
                                                            <li>
                                                                <div class="figure figure-thumb">
                                                                    <a href="coursesdetail?id=${orderItem.itemId}" target="_blank">
                                                                    <img src="${orderItem.itemPic}" width="150" height="80" alt="${orderItem.itemName}&nbsp;&nbsp;"
                                                                         title="${orderItem.itemName}"> </a> </div>
                                                                <p class="name">
                                                                        ${orderItem.itemName}</p>
                                                                <p class="price">${orderItem.price/100}元</p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions">
                                                        <a class="btn btn-small btn-primary" href="/payconfirm?id=${order.orderId}" target="_blank">立即支付</a>
                                                        <input name="order_id_${order.orderId}" value="${order.orderId}" type="hidden" >
                                                        <a class="btn btn-small btn-line-gray" id="cancel_Order" onclick="cancel_Order(${order.orderId})" data-order-id="${order.orderId}" href="javascript:;">取消订单</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${type eq 0 }">
                                    <li class="uc-order-item uc-order-item-finish">
                                        <div class="">
                                            <div class="order-summary">
                                                <div class="order-status">已关闭</div>
                                            </div>
                                            <table class="order-detail-table">
                                                <thead>
                                                <tr>
                                                    <th class="col-main">
                                                        <p class="caption-info">
                                                        <fmt:formatDate value="${order.created}" pattern="yyyy年MM月dd日 hh:mm" />
                                                        <span class="sep">|</span>${order.username}<span class="sep">|</span>订单号：${order.orderId}</a>
                                                        </p>
                                                    </th>
                                                    <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${order.totalFee}</span>元</p>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="order-items"><ul class="goods-list">
                                                        <c:forEach items="${order.orderItems}" var="orderItem">
                                                            <li>
                                                                <div class="figure figure-thumb">
                                                                    <a href="coursesdetail?id=${orderItem.itemId}" target="_blank">
                                                                        <img src="${orderItem.itemPic}" width="150" height="80" alt="${orderItem.itemName}&nbsp;&nbsp;"
                                                                             title="${orderItem.itemName}&nbsp;&nbsp;"> </a> </div>
                                                                <p class="name">
                                                                        ${orderItem.itemName}&nbsp;&nbsp;</a> </p>
                                                                <p class="price">${orderItem.price/100}&nbsp;&nbsp;元  &nbsp;&nbsp;</p>
                                                            </li>
                                                        </c:forEach>
                                                    </ul></td>
                                                    <td class="order-actions">
                                                        <a class="btn btn-small btn-primary" id="restore_Order" onclick="restore_Order(${order.orderId})" data-order-id="${order.orderId}" href="javascript:;">恢复订单</a>
                                                        <a class="btn btn-small btn-line-gray" id="delete_Order" onclick="delete_Order(${order.orderId})" data-order-id="${order.orderId}" href="javascript:;">删除订单</a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
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
<script>
    /**
     * 删除订单
     */
    function delete_Order(orderid) {
        layer.confirm('你真的要删除此订单吗?', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                window.location.href = baselocation + '/delorder?orderid=' + orderid;
            }
        )
    }
    /**
     * 取消订单
     */
    function cancel_Order(orderid){
        layer.confirm('你真的要取消此订单吗?', {
                btn : [ '确定', '取消' ] //按钮
            },function() {
                window.location.href = baselocation+'/cancelorder?orderid='+orderid;
            }
        )
    }

    /**
     * 恢复订单
     */
    function restore_Order(orderid) {
        layer.confirm('你真的要恢复此订单吗?', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                window.location.href = baselocation + '/restore?orderid=' + orderid;
            }
        )
    }
</script>
</html>