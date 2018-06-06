package com.whitedove.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.whitedove.mapper.TbItemCatMapper;
import com.whitedove.pojo.TbItemCat;
import com.whitedove.pojo.TbItemCatExample;
import com.whitedove.web.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whitedove.common.pojo.EUTreeNode;


/**
 * 学科分类管理
 */
@Service
public class ItemCatServiceImpl implements ItemCatService {

	@Autowired
	private TbItemCatMapper itemCatMapper;
	@Override
	public List<EUTreeNode> getCatList(long parentId) {
		
		//创建查询条件
		TbItemCatExample example = new TbItemCatExample();
		TbItemCatExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//根据条件查询
		List<TbItemCat> list = itemCatMapper.selectByExample(example);
		List<EUTreeNode> resultList = new ArrayList<>();
		//把列表转换成treeNodelist
		for (TbItemCat tbItemCat : list) {
			EUTreeNode node = new EUTreeNode();
			node.setId(tbItemCat.getId());
			node.setText(tbItemCat.getName());
			node.setState(tbItemCat.getIsParent()?"closed":"open");
			resultList.add(node);
		}
		//返回结果
		return resultList;
	}
}
