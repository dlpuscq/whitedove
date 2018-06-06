package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbCareer;
import com.whitedove.web.service.JobService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:27
 */
@Controller
public class JobController {

    @Autowired
    private JobService jobService;


    /**
     * 查询职业并且分页显示
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("job/list")
    @ResponseBody
    public EUDataGridResult getjobList(Integer page, Integer rows){
        EUDataGridResult result = jobService.getJobList(page, rows);
        return result;
    }


    /**
     * 修改职业
     */
    @RequestMapping(value="/job/update")
    @ResponseBody
    private WhiteDoveResult updateJob(TbCareer career)throws Exception{
        WhiteDoveResult result = jobService.updateJob(career);
        return result;
    }

    /**
     * 新增职业
     */
    @RequestMapping(value="/job/add")
    @ResponseBody
    private WhiteDoveResult addJob(TbCareer career)throws Exception{
        WhiteDoveResult result = jobService.addJob(career);
        return result;
    }
    /**
     * 删除职业
     */
    @RequestMapping(value = "/job/delete")
    @ResponseBody
    private WhiteDoveResult deleteJob(Integer ids)throws Exception{
        WhiteDoveResult result = jobService.deleteJobr(ids);
        return result;
    }

}
