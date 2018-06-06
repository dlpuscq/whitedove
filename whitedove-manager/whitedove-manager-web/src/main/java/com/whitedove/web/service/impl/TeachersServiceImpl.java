package com.whitedove.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.web.mapper.TeachersMapper;
import com.whitedove.web.mapper.TeachingMapper;
import com.whitedove.web.pojo.Teachers;
import com.whitedove.web.pojo.Teaching;
import com.whitedove.web.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author songcq
 * @description 教师管理Service
 * @date 2018/4/18 17:45
 * @param
 * @return
 */
@Service
public class TeachersServiceImpl implements TeachersService {

    @Autowired
    private TeachersMapper teachersMapper;

    @Autowired
    private TeachingMapper teachingMapper;

    /**
     *
     * @author songcq
     * @description 分页显示教师列表
     * @date 2018/4/18 17:45
     * @param [page, rows]
     * @return com.whitedove.common.pojo.EUDataGridResult
     */
    @Override
    public EUDataGridResult getTeachersList(Integer page, Integer rows,Teachers teachers) {
        // 查询教师列表
        //分页处理
        PageHelper.startPage(page, rows);
        List<Teachers> list = teachersMapper.getTeachersList(teachers);
        // 判断是否查询到结果
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<Teachers> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        // 创建一个返回值对象
        return result;
    }

    /**
     *
     * @author songcq
     * @description  新增教师
     * @date 2018/4/18 17:45
     * @param [teachers, teaching]
     * @return com.whitedove.common.utils.WhiteDoveResult
     */
    @Override
    public WhiteDoveResult insertTeacher(Teachers teachers, Teaching teaching) {
        //补全
        teachers.setCreated(new Date());
        teachers.setUpdated(new Date());
        //插入到数据库
        teachersMapper.insert(teachers);
        String s = teachersMapper.queryMaxId();
        //学科状态，1-正常，2-下架
        teaching.setStatus(1);
        Teaching catName = teachingMapper.getCatName(teaching);
        teaching.setTeacherId(Long.valueOf(s));
        teaching.setCatName(catName.getCatName());
        teachingMapper.insert(teaching);
        return WhiteDoveResult.ok();
    }

}
