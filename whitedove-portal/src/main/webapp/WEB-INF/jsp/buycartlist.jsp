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

    <script src="common/zySearch.js"></script>
    <script src="common/layer/layer.js"></script>
    <script src="common/checks.js"></script>
    <link rel="stylesheet" href="common/base.css">
    <link rel="stylesheet" href="common/cart.css">
    <link rel="stylesheet" href="common/orange.css">
    <title>
        购物车
    </title>
</head>
<body  style="background-color: whitesmoke">
<jsp:include page="top.jsp"/>
<div class="layout layout-margin-top layout-fullscreen">
    <!-- 我的购物车begin -->
    <div class="page-main">
        <div class="container-fluid">
            <div class="catbox hide" id="J_cartBox">
                <table id="cartTable">
                    <thead>
                    <tr>
                        <th>选择学科</th>
                        <th>学科名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${itemList}" var="item">
                        <tr data-sid="#">
                            <td class="checkbox">
                                <input data-initial="true" data-sid="#" data-check-status="1" class="check-one check" type="checkbox"/>
                            </td>
                            <td name="itemid" hidden="true">
                                ${item.id}
                            </td>
                            <td class="goods">
                                <a href="coursesdetail?id=${item.id}&cid=${item.id}" target="_blank">
                                <img src="${item.image}" alt="${item.title}"/></a>
                                <a href="coursesdetail?id=${item.id}&cid=${item.id}" target="_blank">
                                    <span>${item.title}</span>
                                </a>
                            </td>
                            <td class="price">${item.price/100}</td>
                            <td class="count"><div class="change-goods-num clearfix J_changeGoodsNum">
                                <a href="#" class="reduce"></a>
                                <input class="count-input goods-num J_goodsNum" type="text" value="${item.num}" readonly/>
                                <a href="#" class=""></a></div></td>
                            <td class="subtotal">${item.price/100}</td>
                            <td class="operation">
                                <div class="col-action">
                                    <a href="javascript:void(0);" title="删除" class="del J_delGoods"
                                     onclick="cart_list_delete(this,${item.id})">
                                        <i class="glyphicon glyphicon-remove"></i></a>
                                </div>
                            </td>
                            <td name="item" hidden="true">
                                    ${item.title}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="cart-bar clearfix" id="J_cartBar">
                    <div class="section-left"> <a href="${ctx}/courses">继续购物</a>
                        <span class="cart-total">共 <i id="J_cartTotalNum">
                        </i> 件商品，已选择 <i id="J_selTotalNum"></i> 件</span>
                    </div>
                    <span class="total-price"> 合计：<em id="J_cartTotalPrice"></em>元 </span>
                    <a href="javascript:void(0);" class="btn btn-a btn btn-primary" id="J_goCheckout" onclick="J_goCheckout();">
                        去结算</a>
                    <div class="no-select-tip hide" id="J_noSelectTip"> 请勾选需要结算的商品
                        <i class="arrow arrow-a"></i> <i class="arrow arrow-b"></i>
                    </div>
                </div>
            </div>
            <div class="cart-empty hide" id="J_cartEmpty">
                <h2>您的购物车还是空的！</h2>
                <p class="login-desc">登录后将显示您之前加入的商品</p>
                <a href="#" class="btn btn-primary btn-login" id="J_loginBtn">立即登录</a>
                <a href="/courses" class="btn btn-primary btn-shoping J_goShoping">马上去购物</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="bootcamp-confirm-modal">
    <div class="modal-dialog bootcamp-modal" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">购买课程</h4>
            </div>
            <div class="modal-body vip-modal-qrcode">
                <br>
                <div id="coursesname">
                    <span></span>
                </div>
            </div>
            <div class="modal-footer">
                <span class="real-price pull-left" id="moneys"></span>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="bootcamp-confirm-pay" class="btn btn-primary bootcamp-confirm-pay" onclick="pay()">确认购买</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>
<script>

    /** 多选按钮插件 */
    $(document).ready(function() {
        $('input').iCheck({
            checkboxClass : 'icheckbox_flat-orange',
            radioClass : 'iradio_flat-orange'
        });
    });

    window.onload = function() {
        if (!document.getElementsByClassName) {
            document.getElementsByClassName = function(cls) {
                var ret = [];
                var els = document.getElementsByTagName('*');
                for (var i = 0, len = els.length; i < len; i++) {
                    if (els[i].className.indexOf(cls + ' ') >= 0 || els[i].className.indexOf(' ' + cls + ' ') >= 0 || els[i].className.indexOf(' ' + cls) >= 0) {
                        ret.push(els[i]);
                    }
                }
                return ret;
            }
        }

        var table = document.getElementById('cartTable'); // 购物车表格
        var selectInputs = document.getElementsByClassName('iCheck-helper'); // 所有勾选框
        var tr = table.children[1].rows; //行
        var numberTotal = document.getElementById('J_cartTotalNum'); //总共商品数目容器
        var selectedTotal = document.getElementById('J_selTotalNum'); //已选商品数目容器
        var priceTotal = document.getElementById('J_cartTotalPrice'); //总计
        var cartBar = document.getElementById('J_cartBar'); //购物车底部导航栏

        // 更新总数和总价格
        function getTotal() {
            var seleted = 0;
            var number = 0;
            var price = 0;
            for (var i = 0, len = tr.length; i < len; i++) {
                if (tr[i].getElementsByTagName('input')[0].checked) {
                    tr[i].className = 'on';
                    seleted += parseInt(tr[i].getElementsByTagName('input')[1].value);
                    price += parseFloat(tr[i].cells[5].innerHTML);
                } else {
                    tr[i].className = '';
                }
                number += parseInt(tr[i].getElementsByTagName('input')[1].value);
            }
            selectedTotal.innerHTML = seleted;
            priceTotal.innerHTML = price.toFixed(2);
            numberTotal.innerHTML = number;
            if (seleted == 0) {
                $('#J_noSelectTip').removeClass('hide');
                $('#J_goCheckout').removeClass('btn-primary').addClass('btn-disabled');
            } else {
                $('#J_noSelectTip').addClass('hide');
                $('#J_goCheckout').addClass('btn-primary').removeClass('btn-disabled');
            }
        }

        // 购物车商品是否存在
        function cartEmpty() {
            var len = tr.length;
            if (len < 1) {
                console.info(len);
                $('#J_cartEmpty').removeClass('hide');
                $('#J_cartBox').addClass('hide');

            } else {
                $('#J_cartBox').removeClass('hide');
                $('#J_cartEmpty').addClass('hide');
            }
        }

        // 计算单行价格
        function getSubtotal(tr) {
            var cells = tr.cells;
            var price = cells[3]; //单价
            var subtotal = cells[5]; //小计td
            var countInput = tr.getElementsByTagName('input')[1]; //数目input
            var a = tr.getElementsByTagName('a')[2]; //-号
            //写入HTML
            subtotal.innerHTML = (parseInt(countInput.value) * parseFloat(price.innerHTML)).toFixed(2);
        }

        // 点击选择框
        for (var i = 0; i < selectInputs.length; i++) {
            selectInputs[i].onclick = function() {
                var productSpecNumber = this.previousSibling.getAttribute('data-sid');
                if (this.previousSibling.getAttribute('data-check-status') == 1 && this.previousSibling.getAttribute('data-initial') == 'false') {
                    // 选中状态
                    this.previousSibling.setAttribute('data-check-status', 0) ;
                } else if (this.previousSibling.getAttribute('data-check-status') == 0) {
                    // 未选中状态
                    this.previousSibling.setAttribute('data-check-status', 1) ;
                }
                getTotal(); //选完更新总计
            }
        }

        // 点击底部导航栏更新价格
        cartBar.onclick = function() {
            getTotal(); //选完更新总计
            cartEmpty(); // 购物车商品是否存在
        }

        //为每行元素添加事件
        for (var i = 0; i < tr.length; i++) {
            //将点击事件绑定到tr元素
            tr[i].onclick = function(e) {
                var e = e || window.event;
                var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
                var cls = el.className; //触发元素的class
                var countInout = this.getElementsByTagName('input')[1]; // 数目input
                var value = parseInt(countInout.value); //数目
                //通过判断触发元素的class确定用户点击了哪个元素
                getTotal();
            }
        }
        // 默认全选
        for (var j = 0; j < selectInputs.length; j++) {
            if (selectInputs[j].previousSibling.getAttribute('data-check-status') == 1) {
                selectInputs[j].click();
                selectInputs[j].previousSibling.setAttribute('data-initial', false);
            } else {
                selectInputs[j].previousSibling.setAttribute('data-initial', false);
            }
        }

        // 更新总数
        getTotal();
        // 购物车商品是否存在
        cartEmpty();
    }

    /**
     * 购物车商品删除
     */
    function cart_list_delete(obj, data) {
        layer.confirm('确认要删除吗？', {
            btn : [ '确定', '取消' ] //按钮
        }, function() {
            window.location.href="/delete/"+data;
        });
    }

    function pay() {
        var table = document.getElementById('cartTable'); // 购物车表格
        var tr = table.children[1].rows; //行
        var number = 0;
        var price = 0;
        var items = new Array()
        for (var i = 0, len = tr.length; i < len; i++) {
            if (tr[i].getElementsByTagName('input')[0].checked) {
                tr[i].className = 'on';
                price += parseInt(tr[i].cells[5].innerHTML);
                items[i] = parseInt(tr[i].cells[1].innerHTML);
            } else {
                tr[i].className = '';
            }
            number += parseInt(tr[i].getElementsByTagName('input')[1].value);
        }
        var prices = price;
        var b = items.join('-');
        var params = {};
        params.tolprice = prices;
        params.num = number;
        params.itemids = b;
        $.ajax({
            url : baselocation + '/createorder',
            type : 'post',
            dataType : 'json',
            data : params,
            success : function(result) {
                if (result.status == 200) {
                    window.location.href = baselocation + '/payconfirm?id= '+ result.data;
                } else{

                }
            }
        });
    }

    /**
     * 跳转确认订单页面
     */
    function J_goCheckout() {

        if ($('#J_goCheckout').hasClass('btn-primary')) {
            var coursesname = document.getElementById('coursesname'); //课程信息
            var moneys = document.getElementById('moneys'); //总金额
            var table = document.getElementById('cartTable'); // 购物车表格
            var tr = table.children[1].rows; //行
            var number = 0;
            var price = 0;
            var items = new Array()
            for (var i = 0, len = tr.length; i < len; i++) {
                if (tr[i].getElementsByTagName('input')[0].checked) {
                    tr[i].className = 'on';
                    price += parseInt(tr[i].cells[5].innerHTML);
                    items[i] = tr[i].cells[7].innerHTML;
                } else {
                    tr[i].className = '';
                }
                number += parseInt(tr[i].getElementsByTagName('input')[1].value);
                var b = items.join(',');
            }
            moneys.innerHTML = '￥'+price.toFixed(2);
            coursesname.innerHTML = '课程信息：'+b;
            $("#bootcamp-confirm-modal").modal("show");

        }
    }
</script>
</body>
</html>