package com.whitedove.web.service.impl;

import java.util.Date;
import java.util.List;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.mapper.TbItemParamMapper;
import com.whitedove.pojo.TbItemParam;
import com.whitedove.pojo.TbItemParamExample;
import com.whitedove.web.mapper.ItemParamMapper;
import com.whitedove.web.pojo.ItemParam;
import com.whitedove.web.service.ItemParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whitedove.common.utils.WhiteDoveResult;


/**
 * 学科规格参数模板管理
 */
@Service
public class ItemParamServiceImpl implements ItemParamService {

	@Autowired
	private TbItemParamMapper TbitemParamMapper;
	@Autowired
	private ItemParamMapper itemparamMapper;

	@Override
	public WhiteDoveResult getItemParamByCid(long cid) {
		TbItemParamExample example = new TbItemParamExample();
		TbItemParamExample.Criteria criteria = example.createCriteria();
		criteria.andItemCatIdEqualTo(cid);
		List<TbItemParam> list = TbitemParamMapper.selectByExampleWithBLOBs(example);
		// 判断是否查询到结果
		if (list != null && list.size() > 0) {
			return WhiteDoveResult.ok(list.get(0));
		}
		return WhiteDoveResult.ok();
	}

	@Override
	public WhiteDoveResult insertItemParam(TbItemParam itemParam) {
		// 补全pojo
		itemParam.setCreated(new Date());
		itemParam.setUpdated(new Date());
		// 插入到规格参数模板表
		TbitemParamMapper.insert(itemParam);
		return WhiteDoveResult.ok();
	}

	/**
	 * 学科简介查询
	 */
	@Override
	public EUDataGridResult getItemParamList(int page, int rows) {
		// 查询学科简介列表
        //分页处理
        PageHelper.startPage(page, rows);
		List<ItemParam> list = itemparamMapper.getItemParamList();

		// 判断是否查询到结果
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<ItemParam> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
		// 创建一个返回值对象
		return result;
	}

}
