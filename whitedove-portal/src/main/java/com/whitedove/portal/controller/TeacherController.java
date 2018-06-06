package com.whitedove.portal.controller;

import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.pojo.Teachers;
import com.whitedove.portal.service.CoursesService;
import com.whitedove.portal.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/16 13:56
 */
@Controller
public class TeacherController {


    @Autowired
    private TeachersService teachersService;
    @Autowired
    private CoursesService coursesService;
    @Autowired
    private ItemMapper itemMapper;

    /**
     * @description 加载教师列表
     */
    @RequestMapping("/teachers")
    public String showTeachers(Model model) {
        List<Teachers> list = teachersService.getTeachers();
        model.addAttribute("teachers",list);
        return "teachers";
    }

    /**
     * @description 加载教师详细信息
     */
    @RequestMapping("/teacher")
    public String showTeacher(Model model, @RequestParam(value = "id", required = false) Long id,
                              @RequestParam(value = "cid", required = false) Long cid) {
        Teachers teacher = new Teachers();
        teacher.setTeacherId(id);
        List<Teachers> list = teachersService.getTeacherById(teacher);
        List<Item> items = coursesService.queryItem(cid,1);
        List<Item> itemAll = itemMapper.getItemList();
        String num = String.valueOf(cid);
        Long itemNum = itemMapper.getItemNum(num);
        List<Item> itemten = itemAll.subList(0, itemAll.size());
        model.addAttribute("itemNum",itemNum);
        model.addAttribute("teacher",list.get(0));
        model.addAttribute("items",items);
        model.addAttribute("itemten",itemten);
        return "teacher";
    }
}
