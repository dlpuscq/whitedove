package com.whitedove.portal.service.impl;

import com.whitedove.mapper.TbItemMsgMapper;
import com.whitedove.pojo.TbItemMsg;
import com.whitedove.portal.service.OrderMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 20:17
 */
@Service
public class OrderMsgServiceImpl implements OrderMsgService {

    @Autowired
    private TbItemMsgMapper tbItemMsgMapper;

    @Override
    public void addSales(String itemids) {
        String[] s = itemids.split("-");
        TbItemMsg tbItemMsg = new TbItemMsg();
        for (int i = 0; i < s.length; i++) {
            Long itemid = Long.parseLong(s[i]);
            tbItemMsg.setItemId(itemid);
            tbItemMsgMapper.addSalesByPrimaryKey(tbItemMsg);
        }
    }
}
