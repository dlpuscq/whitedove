package com.whitedove.web.mapper;


import com.whitedove.web.pojo.Teachers;

import java.util.List;

/**
 * @Author: songcq
 * @Description:
 * @Date: Created in 2018/4/17 11:33
 */
public interface TeachersMapper {
    List<Teachers> getTeachersList(Teachers teachers);
    int insert(Teachers teachers);
    String queryMaxId();
}
