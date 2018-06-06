package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbItem;


public interface ItemService {
	 WhiteDoveResult getItemById(long bigint);
	 EUDataGridResult getItemList(int page, int rows);
	 WhiteDoveResult createItem(TbItem item, String desc, String itemParam)throws Exception;
	 WhiteDoveResult updateItem(TbItem item, String desc, String itemParam)throws Exception;

	 WhiteDoveResult deleteItem(Long itemId) throws Exception;
     WhiteDoveResult reshelfItem(Long id) throws Exception;
     WhiteDoveResult instockItem(Long id) throws Exception;
}
