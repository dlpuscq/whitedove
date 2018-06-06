package com.whitedove.portal.service;


import com.whitedove.pojo.TbItem;
import com.whitedove.pojo.TbItemDesc;
import com.whitedove.pojo.TbItemParamItem;


import java.util.List;


public interface ItemService {

	List<TbItem> getItemById(Long itemId);
	List<TbItemDesc> getItemDescById(Long itemId);
	List<TbItemParamItem> getItemParamItem(Long itemId);
	String getItemParam(Long itemId);

}
