package com.whitedove.portal.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.pojo.SearchResult;
import com.whitedove.portal.service.SearchService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 学科搜索Controller
 */
@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

    @Autowired
    private ItemMapper itemMapper;
	/**
	 *
	 * @author songcq
	 * @description 查询学科
	 * @date 2018/4/18 17:48
	 * @param [queryString, page, model]
	 * @return java.lang.String
	 */
	@RequestMapping("/search")
	public String search(@RequestParam(value = "q",defaultValue = "")String queryString,
						 @RequestParam(defaultValue="1")Integer page, Model model) throws UnsupportedEncodingException {
        //查询条件不能为空
        if (StringUtils.isBlank(queryString)) {
            queryString = "*";
        }
		if (queryString != null) {
			try {
				queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		SearchResult searchResult = searchService.search(queryString, page);
        List<Item> itemHot = itemMapper.getItemHot();
        model.addAttribute("itemHot",itemHot);
		//向页面传递参数
		model.addAttribute("query", queryString);
		model.addAttribute("itemList", searchResult.getItemList());
		System.out.println(searchResult.getItemList().get(0).getCategoryName());
		model.addAttribute("page", page);
        model.addAttribute("totalPages", searchResult.getPageCount());
		return "search";
	}
}
