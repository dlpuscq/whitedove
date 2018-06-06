package com.whitedove.portal.service.impl;

import com.whitedove.pojo.TbItem;
import com.whitedove.portal.mapper.TeachersMapper;
import com.whitedove.portal.pojo.Teachers;
import com.whitedove.portal.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/14 17:11
 */
@Service
public class TeachersServiceImpl implements TeachersService {

    @Autowired
    private TeachersMapper teachersMapper;

    @Override
    public List<Teachers> getTeacherById(Teachers teachers) {
        List<Teachers> teacher = teachersMapper.getTeachersList(teachers);
        return teacher;
    }

    @Override
    public List<Teachers> getTeachers() {
        List<Teachers> teachers = teachersMapper.getTeachersList();
        return teachers;
    }
}
