package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbItemParam;


/**
 * @author Scq
 * @version 创建时间：2018年3月29日 下午3:37:38
 * 类说明
 */
public interface ItemParamService {
	
	WhiteDoveResult getItemParamByCid(long cid);
	WhiteDoveResult insertItemParam(TbItemParam itemParam);
	EUDataGridResult getItemParamList(int page, int rows);
}
