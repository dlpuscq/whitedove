package com.whitedove.portal.controller;

import com.github.pagehelper.PageInfo;
import com.whitedove.pojo.*;
import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.mapper.TeachersMapper;
import com.whitedove.portal.pojo.*;
import com.whitedove.portal.service.CoursesService;
import com.whitedove.portal.service.IndexService;
import com.whitedove.portal.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @Author: songcq
 * @Description: 课程管理Controller
 * @Date: Created in 2018/4/13 15:51
 */
@Controller
public class CoursesController {
    @Autowired
    private CoursesService coursesService;
    @Autowired
    private IndexService indexService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private TeachersMapper teachersMapper;

    /**
     * @description  分类查询学科
     * @author Songcq
     * @date 2018/5/8 22:18
     */
    @RequestMapping("/courses")
    public String showCourses(@RequestParam(value = "id", required = false, defaultValue = "0") Long id,
                              @RequestParam(value = "cid", required = false) Long cid,
                              @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                               HttpServletRequest request){
        if(cid !=null&&!"".equals(cid)){
            if (cid<=7){
                cid = null;
            }
        }
        List<TbItemCat> tbItemCats = indexService.queryCat(id);
        List<Item> items = coursesService.queryItem(cid,page);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<Item>(items);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        request.setAttribute("pageInfo",pageInfo);
        List<Item> itemHot = itemMapper.getItemHot();
        request.setAttribute("tbItemCats",tbItemCats);
        request.setAttribute("tbTtems",items);
        request.setAttribute("itemHot",itemHot);
        return "courses";
    }

    /**
     * @description  查询学科类别
     * @author Songcq
     * @date 2018/5/8 22:18
     */
    @RequestMapping("/itemcat")
    public  List<TbItemCat> selectOne(Long id, Model model){
        List<TbItemCat> tbItemCats = coursesService.queryItemCat(id);
        return tbItemCats;
    }

    /**
     *
     * @author songcq
     * @description 加载课程详细信息
     * @date 2018/4/18 17:48
     * @param [model]
     * @return java.lang.String
     */
    @RequestMapping(value="/coursesdetail")
    public String showCoursesdetail( Model model, @RequestParam(value = "id", required = false) Long id,
                                     @RequestParam(value = "cid", required = false) String cid,HttpServletRequest request) {

        List<TbItemMsg> tbItemMsgs = coursesService.queryTbItemMsg(id);
        List<TbItem> tbItem = itemService.getItemById(id);
        List<TbItemDesc> tbItemDescs = itemService.getItemDescById(id);
        List<TbMyItem> tbMyItems = coursesService.queryMyItem(id,request);
        List<Item> itemHot = itemMapper.getItemHot();
        if(!tbMyItems.isEmpty()){
            model.addAttribute("flag","flag");
        }else {
            model.addAttribute("flag",null);
        }
        Teachers teacher = new Teachers();
        teacher.setCatId(cid);
        List<Teachers> tbTeaching = teachersMapper.getTeachersList(teacher);
        Long itemNum = itemMapper.getItemNum(cid);
        request.setAttribute("itemHot",itemHot);
        model.addAttribute("tbItem",tbItem.get(0));
        model.addAttribute("tbItemDesc",tbItemDescs.get(0));

        if (tbTeaching.isEmpty() && tbTeaching.size()==0){
            TbTeaching teaching = new TbTeaching();
            teaching.setTeacherName("");
            model.addAttribute("tbTeaching",teaching);
        }else {
            model.addAttribute("tbTeaching",tbTeaching.get(0));
        }
        model.addAttribute("tbItemMsgs",tbItemMsgs.get(0));
        model.addAttribute("itemNum",itemNum);

        return "coursesdetail";
    }

    @RequestMapping(value="/item/param/{itemId}", produces=MediaType.TEXT_HTML_VALUE+";charset=utf-8")
    @ResponseBody
    public String getItemParam(@PathVariable Long itemId) {
        String string = itemService.getItemParam(itemId);
        return string;
    }

}
