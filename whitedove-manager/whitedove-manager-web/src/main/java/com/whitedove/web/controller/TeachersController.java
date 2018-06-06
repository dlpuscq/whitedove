package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbTeachersMapper;
import com.whitedove.mapper.TbTeachingMapper;
import com.whitedove.pojo.TbTeachers;
import com.whitedove.pojo.TbTeachingExample;
import com.whitedove.web.mapper.TeachersMapper;
import com.whitedove.web.pojo.Teachers;
import com.whitedove.web.pojo.Teaching;
import com.whitedove.web.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 *
 * @author songcq
 * @description 教师管理Controller
 * @date 2018/4/18 17:42
 * @param
 * @return
 */
@Controller
@RequestMapping("/teachers")
public class TeachersController {

    @Autowired
    private TeachersService teachersService;
    @Autowired
    private TbTeachersMapper teachersMapper;
    @Autowired
    private TbTeachingMapper tbTeachingMapper;

    /**
     *
     * @author songcq
     * @description 查询教师列表
     * @date 2018/4/18 17:43
     * @param [page, rows]
     * @return com.whitedove.common.pojo.EUDataGridResult
     */
    @RequestMapping("/query/list")
    @ResponseBody
    public EUDataGridResult getItemList(Integer page, Integer rows,@RequestParam(value="catId")String catId) {
        Teachers teachers = new Teachers();
        if (catId!=null&&!"".equals(catId)){
            teachers.setCatId(catId);
        }
        EUDataGridResult result = teachersService.getTeachersList(page, rows,teachers);
        return result;
    }

    /**
     *
     * @author songcq
     * @description 新增教师
     * @date 2018/4/18 17:43
     * @param [teachers, teaching]
     * @return com.whitedove.common.utils.WhiteDoveResult
     */
    @RequestMapping("/save")
    @ResponseBody
    public WhiteDoveResult insertContent(Teachers teachers, Teaching teaching) {
        WhiteDoveResult result = teachersService.insertTeacher(teachers,teaching);
        return result;
    }

    /**
     * 删除教师
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    private WhiteDoveResult deleteTeacher(HttpServletRequest request)throws Exception{
        Long id = new Long(request.getParameter("ids"));
        teachersMapper.deleteByPrimaryKey(id);
        TbTeachingExample example = new TbTeachingExample();
        TbTeachingExample.Criteria criteria = example.createCriteria();
        criteria.andTeacherIdEqualTo(id);
        tbTeachingMapper.deleteByExample(example);
        return WhiteDoveResult.ok();
    }

    /**
     * 修改教师
     */
    @RequestMapping(value="/edit")
    @ResponseBody
    private WhiteDoveResult updateTeacher(TbTeachers teachers){
        teachers.setUpdated(new Date());
        teachersMapper.updateByPrimaryKeySelective(teachers);
        return WhiteDoveResult.ok();
    }
}
