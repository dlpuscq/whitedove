package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.web.pojo.Teachers;
import com.whitedove.web.pojo.Teaching;

public interface TeachersService {
    EUDataGridResult getTeachersList(Integer page, Integer rows,Teachers teachers);
    WhiteDoveResult insertTeacher(Teachers teachers, Teaching tbTeaching);
}
