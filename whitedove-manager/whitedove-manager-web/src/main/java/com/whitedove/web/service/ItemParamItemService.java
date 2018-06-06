package com.whitedove.web.service;

import com.whitedove.common.utils.WhiteDoveResult;

/**
 * @author Scq
 * @version 创建时间：2018年3月30日 下午2:33:24
 * 类说明
 */
public interface ItemParamItemService {
	String getItemParamByItemId(Long itemId);
	WhiteDoveResult getItemParamItem(Long itemId);
}
