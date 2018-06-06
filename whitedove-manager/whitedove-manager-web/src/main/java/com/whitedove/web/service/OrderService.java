package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbOrder;
import com.whitedove.pojo.TbUser;

import javax.servlet.http.HttpServletRequest;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:28
 */
public interface OrderService {
    EUDataGridResult getUserOrderList(int page, int rows,TbOrder tbOrder);
    WhiteDoveResult updateUserOrder(TbOrder order)throws Exception;
    WhiteDoveResult setOrderStatus(TbOrder order) throws Exception;
}
