package com.whitedove.web.controller;


import com.whitedove.common.pojo.EUTreeNode;
import com.whitedove.web.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * @author scq
 * @version 创建时间：2018年3月21日 上午11:58:12
 * 类说明 学科结构
 */
@Controller
@RequestMapping("/item/cat")
public class ItemCatController {
	
	@Autowired
	private ItemCatService itemCatService;
	/**
	 *
	 * @author songcq
	 * @description 在EUTree中显示节点
	 * @date 2018/4/18 17:39
	 * @param
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	private List<EUTreeNode> getCatList(@RequestParam(value="id",defaultValue="0")Long parentId) {
		List<EUTreeNode> list = itemCatService.getCatList(parentId);
		return list;
	}


}
