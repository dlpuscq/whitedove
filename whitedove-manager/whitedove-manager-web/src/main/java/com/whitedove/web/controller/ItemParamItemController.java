package com.whitedove.web.controller;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.web.service.ItemParamItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author Scq
 * @version 创建时间：2018年3月30日 下午2:52:15
 * 类说明  展示学科规格参数Controller
 */
@Controller
@RequestMapping("/item/param/item")
public class ItemParamItemController {

	@Autowired
	private ItemParamItemService itemParamItemService;

	/**
	 *
	 * @author songcq
	 * @description 展示学科规格参数
	 * @date 2018/4/18 17:41
	 * @param [itemId, model]
	 * @return java.lang.String
	 */
	@RequestMapping("/query/{itemId}")
    @ResponseBody
	public WhiteDoveResult showItemParam(@PathVariable Long itemId) {
        WhiteDoveResult result = itemParamItemService.getItemParamItem(itemId);
		return result;
	}
}
