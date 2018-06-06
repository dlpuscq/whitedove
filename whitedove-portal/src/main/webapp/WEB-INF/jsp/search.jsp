<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/common/base.jsp"%>
<%@ include file="/WEB-INF/common/jscss.jsp"%>
<html>
<head>
    <title>${query}课程搜索结果</title>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="container layout-hasside layout-margin-top">
    <div class="search-info">
        <h4>“<span>${query}</span>”的搜索结果</h4>
    </div>
    <div class="row">
        <div class="col-md-12 layout-body">
            <div class="col-md-9 layout-body">
                <div class="content clearfix">
                    <div class="tab-content">
                        <c:forEach items="${itemList}" var="item">
                            <div class="col-md-4 col-sm-6  course">
                                <a class="course-box" href="coursesdetail?id=${item.id}&cid=${item.cid}">
                                    <div class="course-img">
                                        <img src="${item.image}">
                                    </div>
                                    <div class="course-body">
                                        <div class="course-name">${item.title}</div>
                                        <div class="course-desc">${item.sellPoint}</div>
                                        <div class="course-footer">
                                        <span class="course-per-num pull-left">
                                            <i class="fa fa-bars"></i>
                                            <i >价格：</i>
                                            <strong>￥<fmt:formatNumber groupingUsed="false" maxFractionDigits="2"
                                                minFractionDigits="2" value="${item.price / 100 }"/></strong>
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
                                    当前第 ${page} 页
                                </a>
                            </li>
                        <c:choose>
                            <c:when test="${page == 1 }">
                                <li class="disabled">
                                    <a href="" aria-label="Previous">
                                      <span aria-hidden="true">
                                        上一页
                                      </span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                            <li class="">
                                <a href="search?queryString=${query}$page=${page-1}" aria-label="Previous">
                                      <span aria-hidden="true">
                                        上一页
                                      </span>
                                </a>
                            </li>
                            </c:otherwise>
                        </c:choose>
                            <c:choose>
                                <c:when test="${page >= totalPages }">
                                <li class="disabled">
                                    <a aria-label="Next" href="">
                                  <span aria-hidden="true">
                                    下一页
                                  </span>
                                    </a>
                                </li>
                                </c:when>
                            <c:otherwise>
                            <li class="">
                                <a aria-label="Next" href="search?queryString=${query}$page=${page+1}">
                                  <span aria-hidden="true">
                                    下一页
                                  </span>
                                </a>
                            </li>
                            </c:otherwise>
                        </c:choose>
                            <li class="">
                                <a href="#">
                                    共 ${totalPages} 页
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <jsp:include page="right.jsp"></jsp:include>
        </div>
    </div>
</div>
<script type="text/javascript">
    ${paginator.totalPages}
    SEARCH.querys = "${query}";
    SEARCH.bottom_page_html(${page},${totalPages},'');
</script>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
