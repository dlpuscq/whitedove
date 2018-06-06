package com.whitedove.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbCareer;
import com.whitedove.pojo.TbCareerExample;
import com.whitedove.web.mapper.ItemMsgMapper;
import com.whitedove.web.pojo.CourseMsg;
import com.whitedove.web.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:27
 */
@Controller
public class ItemMsgController {

    @Autowired
    private ItemMsgMapper itemMsgMapper;


    /**
     * 查询课程信息
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("itemsg/list")
    @ResponseBody
    public EUDataGridResult getjobList(Integer page, Integer rows,@RequestParam(value="params")String params){
        CourseMsg courseMsg = new CourseMsg();
        courseMsg.setItemName(params);
        //分页处理
        PageHelper.startPage(page, rows);
        List<CourseMsg> list = itemMsgMapper.getItemMsgList(courseMsg);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<CourseMsg> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }


    /**
     * 修改课程销售信息
     */
    @RequestMapping("itemsg/update")
    @ResponseBody
    private WhiteDoveResult updateJob(TbCareer career)throws Exception{

        return WhiteDoveResult.ok();
    }

    /**
     * 查询课程信息
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("itemsg/collection")
    @ResponseBody
    public EUDataGridResult getjobListCol(Integer page, Integer rows,@RequestParam(value="params")String params){

        CourseMsg courseMsg = new CourseMsg();
        if ("correct".equals(params)){
            courseMsg.setCellectionId("correct");
        }else {
            courseMsg.setCellectionId("fall");
        }
        //分页处理
        PageHelper.startPage(page, rows);
        List<CourseMsg> list = itemMsgMapper.getItemMsgList(courseMsg);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<CourseMsg> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }


    /**
     * 查询课程信息
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("itemsg/sales")
    @ResponseBody
    public EUDataGridResult getjobListSal(Integer page, Integer rows,@RequestParam(value="params")String params){
        System.out.println("!!!!!!"+params);
        CourseMsg courseMsg = new CourseMsg();
        if ("correct".equals(params)){
            courseMsg.setSalesId("correct");
        }else if("fall".equals(params)) {
            courseMsg.setSalesId("fall");
        }
        System.out.println(courseMsg);
        //分页处理
        PageHelper.startPage(page, rows);
        List<CourseMsg> list = itemMsgMapper.getItemMsgList(courseMsg);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<CourseMsg> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

}
