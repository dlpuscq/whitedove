package com.whitedove.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbOrderMapper;
import com.whitedove.pojo.TbOrder;
import com.whitedove.pojo.TbOrderExample;
import com.whitedove.web.mapper.OrderMapper;
import com.whitedove.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * @description 订单管理service
 * @autoor Songcq
 * @date 2018/5/31 8:30
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private TbOrderMapper tbOrderMapper;

    @Autowired
    private OrderMapper orderMapper;

    /**
     * 订单列表查询
     */
    @Override
    public EUDataGridResult getUserOrderList(int page, int rows,TbOrder tbOrder) {
        //分页处理
        PageHelper.startPage(page, rows);
        List<TbOrder> list = orderMapper.getOrderList(tbOrder);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<TbOrder> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public WhiteDoveResult updateUserOrder(TbOrder order) throws Exception {
        order.setCreated(new Date());
        order.setUpdated(new Date());
        tbOrderMapper.updateByPrimaryKeySelective(order);
        return WhiteDoveResult.ok();
    }

    /**
     * 修改订单状态
     */
    @Override
    public WhiteDoveResult setOrderStatus(TbOrder tbOrder) throws Exception {
        //'订单状态1有效，0关闭，2删除'
        TbOrderExample tbOrderExample = new TbOrderExample();
        TbOrderExample.Criteria criteria = tbOrderExample.createCriteria();
        criteria.andOrderIdEqualTo(tbOrder.getOrderId());
        tbOrderMapper.updateByExampleSelective(tbOrder,tbOrderExample);
        return WhiteDoveResult.ok();
    }

}
