<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
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
      <title>
        课程信息
      </title>
        <style type="text/css">
            .btn-primary {
                border-color: #ff6700;
                background: #ff6700;
                color: #fff
            }

            .btn-primary:hover {
                border-color: #f25807;
                background-color: #f25807;
                color: #fff
            }

            .btn-primary.focus, .btn-primary:focus{
                border-color: #f25807;
                background-color: #f25807;
                color: #fff
            }
        </style>
    </head>
    <body>
      <jsp:include page="top.jsp" />
      <form id="frm1" class="container layout-hasside layout-margin-top">
        <ol class="breadcrumb">
          <li>
            <a href="courses.html">
              全部课程
            </a>
          </li>
          <li class="active">
            <a href="coursesdetail.html?id=${tbItem.id}">
              ${tbItem.title}
            </a>
          </li>
        </ol>
        <div class="row">
          <div class="col-md-9 layout-body">
            <div class="content course-infobox">
              <div class="clearfix course-infobox-header">
                <h4 class="pull-left course-infobox-title">
                  <span class="course-infobox-type" data-course-type="0">
                    课程信息
                  </span>
                  <span>
                    ${tbItem.title}
                  </span>
                </h4>
                <div id="collectionid" class="pull-right course-infobox-follow" onclick="it_collection(this)" data-iscollection="">
                  <span class="course-infobox-followers" id="itemCollection" >

                  </span>
                    <input hidden="true" id="hiddencollectionid">
                  <span>
                    人关注
                  </span>
                  <i class="fa fa-star-o" id="colitem" >
                  </i>
                </div>
              </div>

              <div class="clearfix course-infobox-body">
                <div class="course-infobox-content">
                  <p>
                    ${tbItem.sellPoint}
                  </p>
                    <c:if test="${not empty flag}">
                    <div class="course-infobox-content">
                        <video src="${tbItem.barcode}" height="450" width="800" controls="controls"></video>
                    </div>
                    </c:if>
                    <c:if test="${empty flag}">
                    <div class="course-infobox-content">
                        <video src="video/empty.mp4" height="450" width="800" controls="controls"></video>
                    </div>
                    </c:if>
                </div>
              </div>
              <div class="clearfix bootcamp-infobox">
                <div class="bootcamp-infobox-footer">
                  <div class="col-md-2 bootcamp-infobox-msg">
                    <img src="images/bootcamp-course.png">
                    <div class="msg-desc">
                      <span>
                        详细的项目
                      </span>
                    </div>
                    <img class="bootcamp-infobox-footer-plus" src="images/bootcamp-plus.png">
                  </div>
                  <div class="col-md-2 bootcamp-infobox-msg">
                    <img src="images/bootcamp-env.png">
                    <div class="msg-desc">
                      <span>
                        实战技术
                      </span>
                    </div>

                    <img class="bootcamp-infobox-footer-plus" src="images/bootcamp-plus.png">
                  </div>
                  <div class="col-md-2 bootcamp-infobox-msg">
                    <img src="images/bootcamp-qa.png">
                    <div class="msg-desc">
                      <span>
                        名师助学
                      </span>
                    </div>
                  </div>
                    <c:if test="${ empty flag}">
                    <div class="col-md-2.5 bootcamp-infobox-msg bootcamp-infobox-buybox">
                        <div class="original-price">
                            ￥${tbItem.price / 100 }
                        </div>

                        <div class="btn btn-primary goods-add-cart-btn" id="buybox">
                            立即购买
                        </div>
                    </div>
                    <div class="col-md-2.5 bootcamp-infobox-msg bootcamp-infobox-buybox">
                        <div class="original-price">
                            &nbsp&nbsp&nbsp
                        </div>
                        <div class="btn btn-primary goods-add-cart-btn" id="buycart">
                            加入购物车
                        </div>
                    </div>
                    </c:if>
                    <c:if test="${not empty flag}">
                        <div class="col-md-2.5 bootcamp-infobox-msg bootcamp-infobox-buybox">
                            <div class="original-price">
                                &nbsp&nbsp&nbsp
                            </div>
                            <div class="btn btn-primary goods-add-cart-btn" id="already">
                                已购买
                            </div>
                        </div>
                    </c:if>
                </div>
              </div>
            </div>
            <div class="content">
              <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active">
                      <a href="#charge-course-detail" aria-controls="charge-course-detail" role="tab" data-toggle="tab">课程介绍</a>
                  </li>
                  <li role="presentation" >
                      <a href="#labs" aria-controls="labs" role="tab" data-toggle="tab" id="p-con-attr">课程列表</a>
                  </li>
              </ul>

              <div class="tab-content">
                <div role="tabpanel" class="tab-pane" id="labs">

                </div>
                  <div role="tabpanel"  class="tab-pane active" id="charge-course-detail">
                    ${tbItemDesc.itemDesc}
                  </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 layout-side">
         <c:if test="${not empty tbTeaching.teacherName}">
            <div class="sidebox mooc-teacher">
              <div class="sidebox-header mooc-header">
                <h4 class="sidebox-title">
                  课程教师
                </h4>
              </div>
              <div class="sidebox-body mooc-content">
                <a href="teacher.html?id=${tbTeaching.teacherId}&cid=${tbTeaching.catId}">
                  <img src="${tbTeaching.pic}">
                </a>
                <div class="mooc-info">
                  <div class="name">
                    <strong>
                      ${tbTeaching.teacherName}
                    </strong>
                  </div>
                  <div class="courses">
                    共发布过
                    <strong>
                      ${itemNum}
                    </strong>
                    门课程
                  </div>
                </div>
              </div>
              <div class="sidebox-footer mooc-footer">
                <a href="teacher.html?id=${tbTeaching.teacherId}&cid=${tbTeaching.catId}">
                  查看老师的所有课程 >
                </a>
              </div>
            </div>
         </c:if>
              <c:if test="${empty tbTeaching.teacherName}">
              <div class="sidebox mooc-teacher">
                  <div class="sidebox-header mooc-header">
                      <h4 class="sidebox-title">
                          该科目暂无老师
                      </h4>
                  </div>
              </div>
              </c:if>
            <div class="sidebox recommend-courses">
              <div class="sidebox-header recommend-courses-header">
                <h4 class="sidebox-title">
                  推荐课程
                </h4>
              </div>
              <div class="sidebox-body recommend-courses-content">
                  <c:forEach items="${itemHot}" var="itemHot">
                      <a href="">
                          <img style="width: 25px; height: 25px" src="${itemHot.images[0]}">
                              ${itemHot.title}
                      </a>
                  </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </form>
      <div class="modal fade" id="bootcamp-pay-modal" tabindex="-1" role="dialog">
          <div class="modal-dialog bootcamp-modal" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">购买课程</h4>
                  </div>
                  <div class="modal-body vip-modal-qrcode">
                      <br>
                      <div>课程信息：
                          <span>${tbItem.title}</span>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <span class="real-price pull-left">￥${tbItem.price / 100 }</span>
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button type="button" id="bootcamp-confirm-pay" class="btn btn-primary bootcamp-confirm-pay" onclick="pay()">确认购买</button>
                  </div>
              </div>
          </div>
      </div>

      <div class="modal fade" id="bootcamp-login-modal" tabindex="-1" role="dialog" >
          <div class="modal-dialog bootcamp-modal" role="document">
              <div class="modal-content">
                  <div class="modal-body vip-modal-qrcode">
                      <a class="vip-wx-method">请先完成登陆</a>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button type="button" id="bootcamp-login" class="btn btn-primary bootcamp-confirm-pay" onclick="goLogin()">去登陆</button>
                  </div>
              </div>
          </div>
      </div>

      <div class="modal fade" id="bootcamp-cart-modal" tabindex="-1" role="dialog" >
          <div class="modal-dialog bootcamp-modal" role="document">
              <div class="modal-content">
                  <div class="modal-body vip-modal-qrcode">
                      <p class="vip-wx-method">购物车已存在该课程</p>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">重新添加购物车</button>
                  </div>
              </div>
          </div>
      </div>

      <jsp:include page="bottom.jsp"/>
    </body>
    <script>

        var collection=${tbItemMsgs.itemCollection};

        // 判断是否收藏商品
        $(function(){
            var itemCollection = document.getElementById('itemCollection');
            document.getElementById('hiddencollectionid').value = ${tbItemMsgs.itemCollection};
            itemCollection.innerHTML = ${tbItemMsgs.itemCollection};
            $.ajax({
                type : 'get',
                dataType : 'json',
                url : baselocation + 'iscollection',
                data : {
                    'itemid': ${tbItem.id}
                },
                success : function(result) {
                        if(result.status == 200) {
                            $('#collectionid').attr('data-iscollection',true);
                            document.getElementById("colitem").style.color="#FF0000";
                        }else {
                            $('#collectionid').attr('data-iscollection',false);
                            document.getElementById("colitem").style.color="#000000";
                        }
                }
            })
        });

        // 收藏商品
        function it_collection(obj) {
            var result = String($(obj).attr('data-iscollection'));
            if(result=="true") {
                $.ajax({
                    type : 'post',
                    dataType : 'json',
                    url : baselocation + 'collection',
                    data : {
                        'itemid': ${tbItem.id},
                        'flag': '2',
                    },
                    success : function(result) {
                        if (result.status == 200) {
                            document.getElementById("colitem").style.color="#000000";
                            $('#collectionid').attr('data-iscollection',false);
                            var hiddencollectionid = document.getElementById('hiddencollectionid').value;
                            hiddencollectionid = parseInt(hiddencollectionid) -1;
                            document.getElementById('hiddencollectionid').value = hiddencollectionid;
                            var itemCollection = document.getElementById('itemCollection');
                            itemCollection.innerHTML =  hiddencollectionid;
                        } else {
                            layer.alert(result.msg, {
                                icon : 2
                            });
                        }
                    }
                })
            }else {
                $.ajax({
                    type : 'post',
                    dataType : 'json',
                    url : baselocation + 'collection',
                    data : {
                        'itemid': ${tbItem.id},
                            'flag': '1',
                    },
                    success : function(result) {
                        if (result.status == 200) {
                            document.getElementById("colitem").style.color="#FF0000";
                            $('#collectionid').attr('data-iscollection',true);
                            var hiddencollectionid = document.getElementById('hiddencollectionid').value;
                            hiddencollectionid = parseInt(hiddencollectionid) + 1;
                            document.getElementById('hiddencollectionid').value = hiddencollectionid;
                            var itemCollection = document.getElementById('itemCollection');
                            itemCollection.innerHTML =  hiddencollectionid;
                        } else {
                            layer.alert(result.msg, {
                                icon : 2
                            });
                        }
                    }
                })
            }
        }

        $(function(){
            $("#buybox").click(function(){
                var hiddename = document.getElementById("hiddename").value;
                if (hiddename !== null || hiddename !== undefined || hiddename !== '')
                    if (hiddename ==null || hiddename == ""){
                        $("#bootcamp-login-modal").modal("show");
                    }else {
                        $("#bootcamp-pay-modal").modal("show");
                    }
            });

            $("#buycart").click(function(){
                $.ajax({
                    type : "POST",
                    url: baselocation + '/buycartadd',
                    data : {
                        'itemid': ${tbItem.id}
                    },
                    dataType : "json",
                    success: function (result) {
                        if (result.status == 200) {
                            window.location.href = baselocation + '/buycartshow?id= + ${tbItem.id}';
                        } else if (result.status == 400) {
                            $("#bootcamp-cart-modal").modal("show");
                        }
                    }
                })
            });
            //取学科id
            var itemId = "${tbItem.id}";
            //给课时列表参数tab页绑定事件
            $("#p-con-attr").bind("click", function(){
                itemControl.getItemParam(itemId);
            });

        });

        $(function(){
            var e = $(".course-infobox-type");
            switch (e.data("courseType")) {
                case 0:
                    e.addClass("course-type-basic");
                    break;
                case 1:
                    e.addClass("course-type-project");
                    break;
                case 2:
                    e.addClass("course-type-charge");
                    break;
                case 3:
                    e.addClass("course-type-evaluation");
                    break;
                default:
                    e.addClass("course-type-basic")
            }
        });
        function pay() {
            $("#bootcamp-pay-modal").modal("hide");

            var params = {};
            params.itemids = ${tbItem.id};
            params.tolprice = ${tbItem.price/100};
            params.num = 1;
            $.ajax({
                url : baselocation + '/createorder',
                type : 'post',
                dataType : 'json',
                data : params,
                success : function(result) {
                    if (result.status == 200) {
                        window.location.href = baselocation + '/payconfirm?id= '+ result.data;
                    }
                }
            });
        }
        function goLogin() {
            $("#bootcamp-pay-modal").modal("hide");
            window.location.href='http://localhost:8083/login';
        }
        var itemControl = {
            param:{
                paramUrl:"/item/param/"
            },
            haveParam:false,
            //请求规格参数
            getItemParam:function(itemId) {
                //如果没有查询过规格参数，就做请求
                if (!itemControl.haveParam) {
                    $.get(itemControl.param.paramUrl+itemId, function(data){
                        //返回html，直接显示到页面
                        $("#labs").append(data);
                        //更改flag状态
                        itemControl.haveParam = true;
                    });
                }
            }
        };

    </script>
  </html>