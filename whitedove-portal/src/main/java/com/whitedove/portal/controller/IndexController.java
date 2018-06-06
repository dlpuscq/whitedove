package com.whitedove.portal.controller;

import com.whitedove.mapper.TbCareerMapper;
import com.whitedove.pojo.TbCareer;
import com.whitedove.pojo.TbCareerExample;
import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.mapper.TeachersMapper;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.pojo.Teachers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @author Scq
 * @version 创建时间：2018年3月31日 下午8:40:04
 * 类说明 页面加载Controller
 */
@Controller
public class IndexController {

    @Autowired
    private TbCareerMapper tbCareerMapper;

    @Autowired
    private TeachersMapper teachersMapper;

    @Autowired
    private ItemMapper itemMapper;
    /**
     *
     * @author songcq
     * @description 首页展示
     * @date 2018/4/18 17:46
     * @param [model]
     * @return java.lang.String
     */
	@RequestMapping("/")
	public String showIndex(Model model) {
        TbCareerExample example = new TbCareerExample();
        List<TbCareer> tbCareer = tbCareerMapper.selectByExample(example);

        List<Teachers> teachers = teachersMapper.getTeachersList();
        model.addAttribute("tbCareer",tbCareer);
        model.addAttribute("teachers",teachers);
		return "index";
	}

	/**
	 *
	 * @author songcq
	 * @description 动态加载公司信息
	 * @date 2018/4/18 17:47
	 * @param [model]
	 * @return java.lang.String
	 */
	@RequestMapping("/companys")
	public String showCompanys(Model model, HttpServletRequest request) {
        TbCareerExample example = new TbCareerExample();
        List<TbCareer> tbCareer = tbCareerMapper.selectByExample(example);
        List<Item> itemHot = itemMapper.getItemHot();
        request.setAttribute("itemHot",itemHot);
        model.addAttribute("tbCareer",tbCareer);
		return "companys";
	}

}
