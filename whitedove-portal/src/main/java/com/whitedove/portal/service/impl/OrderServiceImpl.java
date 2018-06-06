package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.IDUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbMyItemMapper;
import com.whitedove.mapper.TbOrderItemMapper;
import com.whitedove.mapper.TbOrderMapper;
import com.whitedove.pojo.*;
import com.whitedove.portal.mapper.CartItemMapper;
import com.whitedove.portal.mapper.MyItemMapper;
import com.whitedove.portal.mapper.OrderMapper;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.pojo.MyItem;
import com.whitedove.portal.pojo.Order;
import com.whitedove.portal.service.BuyCartService;
import com.whitedove.portal.service.OrderService;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/28 10:17
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private TbOrderMapper tbOrderMapper;
    @Autowired
    private CartItemMapper cartItemMapper;
    @Autowired
    private MyItemMapper myItemMapper;
    @Autowired
    private TbOrderItemMapper tbOrderItemMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private BuyCartService buyCartService;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public WhiteDoveResult createOrder(Long tolprice,Integer num, List<TbOrderItem> itemList, HttpServletRequest request, HttpServletResponse response){

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbOrder tbOrder = new TbOrder();
        Long orderId = IDUtils.genItemId();
        tbOrder.setOrderId(orderId);
        tbOrder.setUserId(user.getId());
        tbOrder.setUsername(user.getUsername());
        tbOrder.setTotalFee(tolprice);
        tbOrder.setNum(num);
        //状态：1、未付款，2、已付款
        tbOrder.setStatus("1");
        Date date = new Date();
        tbOrder.setCreated(date);
        tbOrder.setUpdated(date);
        //向订单表插入数据
        tbOrderMapper.insert(tbOrder);

        //插入订单明细
        for (TbOrderItem tbOrderItem : itemList) {
            //补全订单明细
            //取订单明细id
            tbOrderItem.setOrderId(orderId);
            //向订单明细插入记录
            tbOrderItemMapper.insert(tbOrderItem);
        }
        return WhiteDoveResult.ok(orderId);
    }

    @Override
    public List<TbOrderItem> getOrder(String itemids) {
        String[] s1 = itemids.split("-");
        List<TbOrderItem> cartItem = cartItemMapper.getCatItemList(s1);
        return cartItem;
    }

    @Override
    public List<MyItem> getMyitem(String itemids) {
        String[] s1 = itemids.split("-");
        List<MyItem> myItems = myItemMapper.getMyItemList(s1);
        return myItems;
    }

    @Override
    public List<Order> getMyOrder(HttpServletRequest request,String status) {

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        Order order = new Order();
        order.setUserId(user.getId());
        order.setStatus(status);
        List<Order> orderList = orderMapper.queryMyOrder(order);
        return orderList;
    }

    @Override
    public WhiteDoveResult createMyItem(String itemids, HttpServletRequest request, HttpServletResponse response) {
        List<MyItem> myItems = getMyitem(itemids);
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        //插入订单明细
        for (MyItem item : myItems) {
            //补全我的课程明细
            item.setUserId(user.getId());
            myItemMapper.insert(item);
        }
        return WhiteDoveResult.ok();
    }

    @Override
    public WhiteDoveResult deleteCartItem(String itemids, HttpServletRequest request, HttpServletResponse response) {
        String[] s = itemids.split("-");
        for (int i = 0; i < s.length; i++) {
            buyCartService.deleteCartItem(s[i],request,response);
        }
        return WhiteDoveResult.ok();
    }
}
