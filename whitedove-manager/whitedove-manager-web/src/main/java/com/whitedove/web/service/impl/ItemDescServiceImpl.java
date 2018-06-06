package com.whitedove.web.service.impl;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbItemDescMapper;
import com.whitedove.pojo.TbItem;
import com.whitedove.pojo.TbItemDesc;
import com.whitedove.pojo.TbItemDescExample;

import com.whitedove.web.service.ItemDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemDescServiceImpl implements ItemDescService {

    @Autowired
    private TbItemDescMapper tbItemDescMapper;
    /**
     * 加载学科描述
     * @param itemId
     * @return
     * @throws Exception
     */
    @Override
    public WhiteDoveResult getItemDesc(Long itemId) throws Exception {
        TbItemDescExample example = new TbItemDescExample();
        TbItemDescExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemId);
        List<TbItemDesc> list = tbItemDescMapper.selectByExampleWithBLOBs(example);
        // 判断是否查询到结果
        if (list != null && list.size() > 0) {
            return WhiteDoveResult.ok(list.get(0));
        }
        return WhiteDoveResult.ok();
    }
}
