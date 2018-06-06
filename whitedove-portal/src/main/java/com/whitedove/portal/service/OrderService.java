package com.whitedove.portal.service;

import com.whitedove.common.utils.WhiteDoveResult;

import com.whitedove.pojo.TbOrder;
import com.whitedove.pojo.TbOrderItem;
import com.whitedove.portal.pojo.MyItem;
import com.whitedove.portal.pojo.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/28 10:15
 */
public interface OrderService {
    WhiteDoveResult createOrder(Long tolprice,Integer num, List<TbOrderItem> itemList , HttpServletRequest request, HttpServletResponse response);
    List<TbOrderItem> getOrder(String itemids);
    WhiteDoveResult createMyItem(String itemids,HttpServletRequest request, HttpServletResponse response);
    WhiteDoveResult deleteCartItem(String itemids, HttpServletRequest request, HttpServletResponse response);
    List<MyItem> getMyitem(String itemids);
    public List<Order> getMyOrder(HttpServletRequest request,String status);
}
