<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="col-md-3 layout-side">
    <div class="panel panel-default panel-userinfo">
        <div class="panel-body body-userinfo">
            <div class="media userinfo-header">
                <div class="media-left">
                    <div class="user-avatar">
                        <a class="avatar" href="" data-toggle="modal" data-sign="signin">
                            <img class="circle" src="images/logo-grey.png">
                        </a>
                    </div>
                </div>
                <div class="media-body">
                                <span class="media-heading username">
                                  欢迎来到小白鸽
                                </span>
                    <p class="vip-remain">
                        来小白鸽，学编程
                    </p>
                </div>
            </div>
            <div class="row userinfo-data" id="rightlogin">
                <hr>
                <div class="btn-group-lr" >
                    <a href="http://localhost:8083/login" type="button" class="btn btn-success col-md-5 col-xs-6 login-btn"
                       data-toggle="modal" data-sign="signin">
                        登录
                    </a>
                    <a href="http://localhost:8083/register" type="button" class="btn btn-success col-md-5 col-xs-6 col-md-offset-1 register-btn"
                       data-toggle="modal" data-sign="signup">
                        注册
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="sidebox">
        <div class="sidebox-header">
            <h4 class="sidebox-title">
                最热课程
            </h4>
        </div>
        <div class="sidebox-body course-content side-list-body">
            <c:forEach items="${itemHot}" var="itemHot">
            <a href="">
                <img style="width: 25px; height: 25px" src="${itemHot.images[0]}">
                ${itemHot.title}
            </a>
            </c:forEach>
        </div>
    </div>
</div>