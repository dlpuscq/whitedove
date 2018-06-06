<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="span3">
    <div class="uc-box uc-sub-box">
                <div class="uc-nav-box">
                    <div class="box-hd">
                        <h3 class="title">订单中心</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="uc-nav-list">
                            <li><a href="${ctx}/myorder">我的订单</a></li>
                        </ul>
                    </div>
                </div>
                <div class="uc-nav-box">
                    <div class="box-hd">
                        <h3 class="title">个人中心</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="uc-nav-list">
                            <li><a href="${ctx}/mycourses">我的课程</a></li>
                        </ul>
                        <ul class="uc-nav-list">
                            <li><a href="${ctx}/mine">个人信息</a></li>
                        </ul>
                        <ul class="uc-nav-list">
                            <li><a href="${ctx}/changepwd">修改密码</a></li>
                        </ul>
                    </div>
                </div>

            </div>
</div>

