package com.whitedove.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbCareerMapper;
import com.whitedove.pojo.TbCareer;
import com.whitedove.pojo.TbCareerExample;
import com.whitedove.web.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description 用户管理service
 * @autoor Songcq
 * @date 2018/5/31 8:30
 */
@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private TbCareerMapper careerMapper;

    @Override
    public EUDataGridResult getJobList(int page, int rows) {
        //查询用户列表
        TbCareerExample example = new TbCareerExample();
        //分页处理
        PageHelper.startPage(page, rows);
        List<TbCareer> list = careerMapper.selectByExample(example);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<TbCareer> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public WhiteDoveResult updateJob(TbCareer career) throws Exception {
        career.setCreated(new Date());
        career.setUpdated(new Date());
        careerMapper.updateByPrimaryKeySelective(career);
        return WhiteDoveResult.ok();
    }

    @Override
    public WhiteDoveResult addJob(TbCareer career) throws Exception {
        career.setCreated(new Date());
        career.setUpdated(new Date());
        careerMapper.insert(career);
        return WhiteDoveResult.ok();
    }

    @Override
    public WhiteDoveResult deleteJobr(Integer ids) throws Exception {
        careerMapper.deleteByPrimaryKey(ids);
        return WhiteDoveResult.ok();
    }
}
