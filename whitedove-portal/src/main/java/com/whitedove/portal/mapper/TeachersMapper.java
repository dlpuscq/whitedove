package com.whitedove.portal.mapper;

import com.whitedove.portal.pojo.Teachers;

import java.util.List;

/**
 * @Author: songcq
 * @Description:
 * @Date: Created in 2018/4/17 11:33
 */
public interface TeachersMapper {
    List<Teachers> getTeachersList();
    List<Teachers> getTeachersList(Teachers teachers);
    int insert(Teachers teachers);
    String queryMaxId();
}
