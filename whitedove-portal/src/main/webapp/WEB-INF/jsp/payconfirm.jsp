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
    <title>支付确认</title>
</head>
<body>
<jsp:include page="top.jsp" />

<div class="page-main page-mini-main">
    <div class="container-fluid confirm-box">
        <form target="_blank" action="#" id="J_payForm" method="post">
            <br><br><br>
            <div class="section section-order">
                <div class="order-info clearfix">
                    <div class="fl">
                        <h2 class="title">订单提交成功！去付款咯～</h2>
                        <p class="order-time">请在<span class="pay-time-tip">23小时55分</span>内完成支付, 超时后将取消订单</p>
                        <br>
                        <p class="order-time">订单号：<span class="pay-time-tip">${order.orderId}</span</p>
                        <p class="order-time">用户：<span class="pay-time-tip">${order.username}</span></p>
                    </div>
                    <div class="fr">
                        <p class="total"> 应付总额：<span class="money"><em>${order.totalFee}</em>元</span> </p>
                        <a href="javascript:void(0);" class="show-detail" id="J_showDetail">订单详情&nbsp;
                            <i class="glyphicon glyphicon-chevron-down"></i></a> </div>
                </div>
                <i class="iconfont icon-right">&#x221a;</i>
                <div class="order-detail">
                    <ul>
                        <li class="clearfix">
                            <div class="label">订单号：</div>
                            <span class="order-num">${order.orderId}</span>
                        </li>
                        <li class="clearfix">
                            <div class="label">用户：</div>
                            <span class="order-num">${order.username}</span>
                        </li>
                        <li class="clearfix">
                            <div class="label">购买数量：</div>
                            <span class="order-num">${order.num}</span>
                        </li>
                        <li class="clearfix">
                            <div class="label">总金额：</div>
                            <span class="order-num">${order.totalFee}</span>
                        </li>
                        <li class="clearfix">
                            <div class="label">创建时间：</div>
                            <span class="order-num">${order.created}</span>
                        </li>
                        <li class="clearfix">
                            <div class="label">订单状态：</div>
                            <span class="order-num">
                                <c:choose>
                                    <c:when test= "${order.status} =='1'">
                                        未付款
                                    </c:when>
                                    <c:when test="${order.status} == '2'">
                                        已付款
                                    </c:when>
                                    <c:otherwise>
                                        待支付
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="section section-payment">
                <div class="cash-title" id="J_cashTitle"> 选择以下支付方式付款 </div>
                <div class="payment-box ">
                    <div class="payment-header clearfix">
                        <h3 class="title">支付平台</h3>
                        <span class="desc"></span> </div>
                    <div class="payment-body">
                        <ul class="clearfix payment-list J_paymentList J_linksign-customize">
                            <li id="J_weixin"><img src="//c1.mifile.cn/f/i/15/pay/wechat0715.jpg" alt="微信支付" style="margin-left: 0;"/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="alipay" value="alipay" />
                                <img src="//c1.mifile.cn/f/i/15/pay/alipay-0718-1.png" alt="支付宝" style="margin-left: 0;"/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="unionpay" value="unionpay" />
                                <img src="//s01.mifile.cn/i/banklogo/unionpay.png?ver2015" alt="银联" style="margin-left: 0;"/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="cft" value="cft" />
                                <img src="//s01.mifile.cn/i/banklogo/cft.png" alt="财付通" style="margin-left: 0;"/></li>
                        </ul>
                        <div class="event-desc">
                            <p>微信支付：关注小米手机微信公众号，支付成功后可领取3-10元电影票红包。</p>
                            <p>支 付 宝：支付宝扫码支付满38元，参与赢取1999元红包</p>
                            <a href="#" class="more" >了解更多&gt;</a> </div>
                    </div>
                </div>
                <div class="payment-box ">
                    <div class="payment-header clearfix">
                        <h3 class="title">银行借记卡及信用卡</h3>
                    </div>
                    <div class="payment-body">
                        <ul class="clearfix payment-list payment-list-much J_paymentList J_linksign-customize">
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CMB" value="CMB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="ICBCB2C" value="ICBCB2C" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CCB" value="CCB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_jsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="COMM" value="COMM" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_jtyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="ABC" value="ABC" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_nyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="BOCB2C" value="BOCB2C" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zgyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="PSBC-DEBIT" value="PSBC-DEBIT" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_youzheng.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="GDB" value="GDB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gfyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="SPDB" value="SPDB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_pufa.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CEBBANK" value="CEBBANK" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gdyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CIB" value="CIB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_xyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CMBC" value="CMBC" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_msyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CITIC" value="CITIC" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zxyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="SHBANK" value="SHBANK" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_shyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="BJRCB" value="BJRCB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_bjnsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="NBBANK" value="NBBANK" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_nbyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="HZCBB2C" value="HZCBB2C" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_hzyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="SHRCB" value="SHRCB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_shnsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="FDB" value="FDB" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_fcyh.png?ver2015" alt=""/></li>
                        </ul>
                    </div>
                </div>
                <div class="payment-box payment-box-last ">
                    <div class="payment-header clearfix">
                        <h3 class="title">快捷支付</h3>
                        <span class="desc">（支持以下各银行信用卡以及部分银行借记卡）</span> </div>
                    <div class="payment-body">
                        <ul class="clearfix payment-list  J_paymentList J_linksign-customize">
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CMB-KQ" value="CMB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="COMM-KQ" value="COMM-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_jtyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CCB-KQ" value="CCB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_jsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="ICBCB2C-KQ" value="ICBCB2C-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gsyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CITIC-KQ" value="CITIC-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zxyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CEBBANK-KQ" value="CEBBANK-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gdyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="BOCB2C-KQ" value="BOCB2C-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_zgyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="SRCB-KQ" value="SRCB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_shncsyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="JSB-KQ" value="JSB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_jiangsshuyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="CIB-KQ" value="CIB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_xyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="ABC-KQ" value="ABC-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_nyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="SPABANK-KQ" value="SPABANK-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_payh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="HXB-KQ" value="HXB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_hyyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="GDB-KQ" value="GDB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_gfyh.png?ver2015" alt=""/></li>
                            <li class="J_bank">
                                <input type="radio" name="payOnlineBank" id="BOB-KQ" value="BOB-KQ" />
                                <img src="//s01.mifile.cn/i/banklogo/payOnline_bjyh.png?ver2015" alt=""/></li>
                        </ul>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
</div>
</body>
<script>
    /**
     * 订单详情
     */
    var flag = 1;
    $(function() {
        $('#J_showDetail').click(function() {
            if (flag==1){
                $('.order-detail').css('display', 'block');
                flag=0;
            }else if (flag==0) {
                $('.order-detail').css('display', 'none');
                flag=1;
            }
        })
    })
</script>
</html>
