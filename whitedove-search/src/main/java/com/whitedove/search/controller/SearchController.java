package com.whitedove.search.controller;

import com.whitedove.common.utils.ExceptionUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.search.pojo.SearchResult;
import com.whitedove.search.service.SearchService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 科目查询Controller
 */
@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="/query", method=RequestMethod.GET)
	@ResponseBody
	public WhiteDoveResult search(@RequestParam(value = "q")String queryString,
								  @RequestParam(defaultValue="1")Integer page,
								  @RequestParam(defaultValue="60")Integer rows) {
		//查询条件不能为空
		if (StringUtils.isBlank(queryString)) {
			return WhiteDoveResult.build(400, "查询条件不能为空");
		}
		SearchResult searchResult = null;
		try {
			queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
			searchResult = searchService.search(queryString, page, rows);

		} catch (Exception e) {
			e.printStackTrace();
			return WhiteDoveResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return WhiteDoveResult.ok(searchResult);
		
	}
	
}
