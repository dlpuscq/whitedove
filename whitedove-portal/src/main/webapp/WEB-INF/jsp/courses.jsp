<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        全部 - 课程 - 小白鸽
      </title>
    </head>
    <body>
      <jsp:include page="top.jsp" />
      <div class="layout layout-margin-top layout-fullscreen">
      <div class="container layout-hasside layout-margin-top" >
        <div class="sub-menu">
          <a class="active" href="courses">
            <i class="fa fa-th">
            </i>
            全部课程
          </a>
          <a class="" href="companys">
            <i class="fa fa-th-large">
            </i>
            职业方向
          </a>
        </div>
        <div class="row">
          <div class="col-md-9 layout-body">
            <div class="content">
              <div class="row course-cates">
                <div class="col-md-1 course-cates-title">类别:</div>
                <div class="col-md-11 course-cates-content">
                  <a class="active" href="${ctx}/courses">
                    全部
                  </a>
                    <c:forEach items="${tbItemCats}" var="u">
                    <a class="${u.parentId eq u.id ? 'active':''}" href="${ctx}/courses?id=${u.id}&cid=${u.id}">${u.name} </a>
                    </c:forEach>
                </div>
              </div>
            </div>
            <div class="content position-relative">
              <ul class="nav nav-tabs" role="tablist">
                <li class="active">
                  <a href="courses">
                    已上线
                  </a>
                </li>
              </ul>
              <div class="row">
                  <c:forEach items="${tbTtems}" var="item">
                <div class="col-md-4 col-sm-6  course">
                  <a class="course-box" href="coursesdetail?id=${item.id}&cid=${item.cid}">
                    <div class="course-img">
                        <img src="${item.images[0]}">
                    </div>
                    <div class="course-body">
                      <div class="course-name">
                        ${item.title}
                      </div>
                      <div class="course-desc">
                       ${item.sellPoint}
                      </div>
                      <div class="course-footer">
                        <span class="course-per-num pull-left">
                          <i class="fa fa-bars"></i>
                            <i>价格:</i>
                            <strong>￥<fmt:formatNumber groupingUsed="false" maxFractionDigits="2"
                                                       minFractionDigits="2" value="${item.price / 100 }"/></strong>
                            |
                            <i>已有<strong>${item.sales}</strong>人购买课程</i>
                        </span>
                      </div>
                    </div>
                  </a>
                </div>
                  </c:forEach>
              </div>
              <nav class="pagination-container">

                <ul class="pagination">
                    <li class="">
                        <a href="#">
                            当前第 ${pageInfo.pageNum} 页
                        </a>
                    </li>
                  <li class="">
                    <a href="courses?page=${pageInfo.pageNum-1}" aria-label="Previous">
                      <span aria-hidden="true">
                        上一页
                      </span>
                    </a>
                  </li>
                  <li class="">
                    <a aria-label="Next" href="courses?page=${pageInfo.pageNum+1}">
                      <span aria-hidden="true">
                        下一页
                      </span>
                    </a>
                  </li>
                    <li class="">
                        <a href="#">
                            共 ${pageInfo.pages} 页 共 ${pageInfo.total} 条记录
                        </a>
                    </li>
                </ul>
              </nav>
            </div>
          </div>
            <jsp:include page="right.jsp" />
        </div>
      </div>
      </div>
      <jsp:include page="bottom.jsp" />
    </body>
</html>