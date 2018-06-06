package com.whitedove.portal.controller;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbOrderMapper;
import com.whitedove.pojo.TbOrder;
import com.whitedove.pojo.TbOrderExample;
import com.whitedove.pojo.TbOrderItem;
import com.whitedove.portal.pojo.Order;
import com.whitedove.portal.service.OrderMsgService;
import com.whitedove.portal.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/17 10:43
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderMsgService orderMsgService;
    @Autowired
    private TbOrderMapper tbOrderMapper;

    @RequestMapping("/payconfirm")
    public String payConfirm(Model model, @RequestParam(value = "id", required = false) Long id){
        TbOrderExample example = new TbOrderExample();
        TbOrderExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(id);
        List<TbOrder> tbOrders = tbOrderMapper.selectByExample(example);
        model.addAttribute("order",tbOrders.get(0));
        return "payconfirm";
    }

    @RequestMapping(value = "createorder", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult createOrder(String itemids,String tolprice,String num,HttpServletRequest request,HttpServletResponse response){
        List<TbOrderItem> order = orderService.getOrder(itemids);
        orderService.createMyItem(itemids,request,response);
        orderMsgService.addSales(itemids);
        orderService.deleteCartItem(itemids,request,response);
        Long prices = Long.parseLong(tolprice);
        Integer number = Integer.parseInt(num);
        WhiteDoveResult result = orderService.createOrder(prices,number,order,request,response);
        return result;
    }

    @RequestMapping("/myorder")
    public String myOrder(HttpServletRequest request,@RequestParam(value = "status", required = false,defaultValue = "1")String status){
        List<Order> orderList = orderService.getMyOrder(request,status);
        if (!orderList.isEmpty()){
            String type = orderList.get(0).getStatus();
            request.setAttribute("type",type);
        }
        request.setAttribute("orderList",orderList);
        return "myorder";
    }


    @RequestMapping("/cancelorder")
    public String cancelorder(HttpServletRequest request,Long orderid){
        TbOrderExample example = new TbOrderExample();
        TbOrderExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(orderid);
        TbOrder tbOrder = new TbOrder();
        tbOrder.setStatus("0");
        tbOrderMapper.updateByExampleSelective(tbOrder,example);
        //订单状态1有效，0关闭，2删除
        String status = "1";
        List<Order> orderList = orderService.getMyOrder(request,status);
        if (!orderList.isEmpty()){
            String type = orderList.get(0).getStatus();
            request.setAttribute("type",type);
        }
        request.setAttribute("orderList",orderList);
        return "myorder";
    }

    @RequestMapping("/delorder")
    public String delorder(HttpServletRequest request,Long orderid){
        TbOrderExample example = new TbOrderExample();
        TbOrderExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(orderid);
        TbOrder tbOrder = new TbOrder();
        tbOrder.setStatus("2");
        tbOrderMapper.updateByExampleSelective(tbOrder,example);
        //订单状态1有效，0关闭，2删除
        String status = "0";
        List<Order> orderList = orderService.getMyOrder(request,status);
        if (!orderList.isEmpty()){
            String type = orderList.get(0).getStatus();
            request.setAttribute("type",type);
        }
        request.setAttribute("orderList",orderList);
        return "myorder";
    }

    @RequestMapping("/restore")
    public String restore(HttpServletRequest request,Long orderid){

        TbOrderExample example = new TbOrderExample();
        TbOrderExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(orderid);
        TbOrder tbOrder = new TbOrder();
        tbOrder.setStatus("1");
        tbOrderMapper.updateByExampleSelective(tbOrder,example);
        //订单状态1有效，0关闭，2删除
        String status = "0";
        List<Order> orderList = orderService.getMyOrder(request,status);
        if (!orderList.isEmpty()){
            String type = orderList.get(0).getStatus();
            request.setAttribute("type",type);
        }
        request.setAttribute("orderList",orderList);
        return "myorder";
    }
}
