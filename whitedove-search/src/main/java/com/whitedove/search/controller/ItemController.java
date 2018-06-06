package com.whitedove.search.controller;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.search.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 索引库维护
 */
@Controller
@RequestMapping("/manager")
public class ItemController {
	
	@Autowired
	private ItemService itemService;

	/**
	 * 导入学科数据到索引库
	 */
	@RequestMapping("/importall")
	@ResponseBody
	public WhiteDoveResult importAllItems() {
		WhiteDoveResult result = itemService.importAllItems();
		return result;
	}
}
