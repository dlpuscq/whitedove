package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;

import com.whitedove.pojo.TbOrder;
import com.whitedove.web.mapper.OrderMapper;
import com.whitedove.web.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:27
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService userOrderService;

    /**
     * 查询订单并且分页显示
     * @param page
     * @param rows
     * @return
     */

    @RequestMapping("order/list")
    @ResponseBody
    public EUDataGridResult getUserOrderList(Integer page, Integer rows,@RequestParam(value="params")String params) {
        TbOrder tbOrder = new TbOrder();
        if (params != null && !"".equals(params)) {
            tbOrder.setUsername(params);
        }
        EUDataGridResult result = userOrderService.getUserOrderList(page, rows, tbOrder);
        return result;
    }

    /**
     * 修改订单
     */
    @RequestMapping(value="/order/update")
    @ResponseBody
    private WhiteDoveResult updateUserOrder(TbOrder order)throws Exception{
        WhiteDoveResult result = userOrderService.updateUserOrder(order);
        return result;
    }

    /**
     * 删除订单
     */
    @RequestMapping(value = "/order/delete")
    @ResponseBody
    private WhiteDoveResult deleteOrder(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //'订单状态1有效，0关闭，2删除'
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        TbOrder tbOrder = new TbOrder();
        tbOrder.setOrderId(itemid);
        tbOrder.setStatus("2");
        WhiteDoveResult result = userOrderService.setOrderStatus(tbOrder);
        return result;
    }

    /**
     * 恢复订单
     */
    @RequestMapping(value = "/order/restore")
    @ResponseBody
    private WhiteDoveResult restoreOrder(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //'订单状态1有效，0关闭，2删除'
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        TbOrder tbOrder = new TbOrder();
        tbOrder.setOrderId(itemid);
        tbOrder.setStatus("1");
        WhiteDoveResult result = userOrderService.setOrderStatus(tbOrder);
        return result;
    }

    /**
     * 取消订单
     */
    @RequestMapping(value = "/order/cancel")
    @ResponseBody
    private WhiteDoveResult cancelOrder(HttpServletRequest request, HttpServletResponse response)throws Exception{
        //'订单状态1有效，0关闭，2删除'
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        TbOrder tbOrder = new TbOrder();
        tbOrder.setOrderId(itemid);
        tbOrder.setStatus("0");
        WhiteDoveResult result = userOrderService.setOrderStatus(tbOrder);
        return result;
    }
}
