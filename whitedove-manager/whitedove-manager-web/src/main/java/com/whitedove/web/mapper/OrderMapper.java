package com.whitedove.web.mapper;

import com.whitedove.pojo.TbOrder;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/6/1 10:17
 */
public interface OrderMapper {
    List<TbOrder> getOrderList(TbOrder tbOrder);
}
