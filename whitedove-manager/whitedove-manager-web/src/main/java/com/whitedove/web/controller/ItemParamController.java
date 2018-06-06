package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUDataGridResult;

import com.whitedove.mapper.TbItemParamMapper;
import com.whitedove.pojo.TbItemParam;
import com.whitedove.web.mapper.ItemParamMapper;
import com.whitedove.web.service.ItemParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whitedove.common.utils.WhiteDoveResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;


/**
 * 学科规格参数模板管理Controller
 */
@Controller
@RequestMapping("/item/param")
public class ItemParamController {

	@Autowired
	private ItemParamService itemParamService;
	@Autowired
    private TbItemParamMapper itemParamMapper;

	/**
	 * 加载学科结构
	 * @param itemCatId
	 * @return
	 */
	@RequestMapping("/query/itemcatid/{itemCatId}")
	@ResponseBody
	public WhiteDoveResult getItemParamByCid(@PathVariable Long itemCatId) {
		WhiteDoveResult result = itemParamService.getItemParamByCid(itemCatId);
		return result;
	}

    /**
     * 保存学科param对象
     * @param cid
     * @param paramData
     * @return
     */
	@RequestMapping("/save/{cid}")
	@ResponseBody
	public WhiteDoveResult insertItemParam(@PathVariable Long cid, String paramData) {
		//创建pojo对象
		TbItemParam itemParam = new TbItemParam();
		itemParam.setItemCatId(cid);
		itemParam.setParamData(paramData);
		WhiteDoveResult result = itemParamService.insertItemParam(itemParam);
		return result;
	}

	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getItemParamList(Integer page, Integer rows){
		EUDataGridResult result = itemParamService.getItemParamList(page, rows);

		return result;
	}

	/**
	 * 加载学科规格
	 */
	@RequestMapping(value="/query/{itemId}")
	@ResponseBody
	private WhiteDoveResult getParamItem(@PathVariable Long itemId)throws Exception{
		WhiteDoveResult result = itemParamService.getItemParamByCid(itemId);
		return result;
	}

	/**
	 * 删除学科规格
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	private WhiteDoveResult deleteParamItem(HttpServletRequest request)throws Exception{
        Long id = new Long(request.getParameter("ids"));
        itemParamMapper.deleteByPrimaryKey(id);
		return WhiteDoveResult.ok();
	}
}
