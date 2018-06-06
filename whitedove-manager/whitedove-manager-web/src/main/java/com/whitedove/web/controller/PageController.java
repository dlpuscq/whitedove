package com.whitedove.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Scq
 * @version 创建时间：2018年3月15日 下午4:13:08
 * 类说明 页面跳转Controller
 */
@Controller
public class PageController {
	/**
	 * 打开首页
	 */
	@RequestMapping("/")
	public String showIndex(){
		return "login";
	}

	/**
	 *
	 * @author songcq
	 * @description 分页测试
	 * @date 2018/4/18 17:42
	 * @param [page]
	 * @return java.lang.String
	 */
	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page){
		
		return page;
	}
}
