package com.whitedove.portal.service;


import com.whitedove.portal.pojo.Teachers;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/14 17:05
 */
public interface TeachersService {
    List<Teachers> getTeacherById(Teachers teachers);
    List<Teachers> getTeachers();
}
