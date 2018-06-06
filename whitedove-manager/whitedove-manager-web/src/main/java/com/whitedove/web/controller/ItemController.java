package com.whitedove.web.controller;


import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.HttpClientUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbItem;
import com.whitedove.web.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
/**
 *
 * @author songcq
 * @description 学科信息Controller
 * @date 2018/4/18 17:39
 * @param
 * @return
 */
@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;

	/**
     *
     * @author songcq
     * @description 通过id查询学科列表
     * @date 2018/4/18 17:40
     * @param
     * @return
     */
	@RequestMapping("/item/{itemId}")
	@ResponseBody
	public WhiteDoveResult getItemById(@PathVariable Long itemId){
		WhiteDoveResult result = itemService.getItemById(itemId);
		return result;
	}
	
	/**
	 * 查询学科并且分页显示
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("item/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows){
		EUDataGridResult result = itemService.getItemList(page, rows);
		return result;
	}
	
	/**
	 * 保存学科
	 */
	@RequestMapping(value="/item/save",method=RequestMethod.POST)
	@ResponseBody
	private WhiteDoveResult createItem(TbItem item, String desc, String itemParams) throws Exception{
		WhiteDoveResult result = itemService.createItem(item,desc,itemParams);
        HttpClientUtil.doGet("http://localhost:8082/search/manager/importall");
		return result;		
	}
	
	/**
	 * 修改学科
	 */
	@RequestMapping(value="/item/update")
	@ResponseBody
	private WhiteDoveResult updateItem(TbItem item, String desc, String itemParams)throws Exception{
		WhiteDoveResult result = itemService.updateItem(item,desc,itemParams);
        HttpClientUtil.doGet("http://localhost:8082/search/manager/importall");
		return result;		
	}

	/**
	 * 删除学科
	 */
	@RequestMapping(value = "/item/delete")
    @ResponseBody
    private WhiteDoveResult deleteItem(HttpServletRequest request,HttpServletResponse response)throws Exception{
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        WhiteDoveResult result = itemService.deleteItem(itemid);
        return result;
    }

    /**
     * 上架学科
     */
    @RequestMapping(value="/item/reshelf")
    @ResponseBody
    private WhiteDoveResult reshelfItem(HttpServletRequest request,HttpServletResponse response)throws Exception{
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        WhiteDoveResult result = itemService.reshelfItem(itemid);
        return result;
    }

    /**
     * 下架学科
     */
    @RequestMapping(value="/item/instock")
    @ResponseBody
    private WhiteDoveResult instockItem(HttpServletRequest request,HttpServletResponse response)throws Exception{
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        WhiteDoveResult result = itemService.instockItem(itemid);
        return result;
    }

}
