package com.whitedove.portal.mapper;

import com.whitedove.portal.pojo.Order;
import com.whitedove.portal.pojo.UserOrder;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/26 16:45
 */
public interface OrderMapper {
    Long queryMaxId();
    List<Order> queryMyOrder(Order order);
    Long getOrderNum(UserOrder userOrder);
}
