package com.whitedove.web.mapper;

import com.whitedove.web.pojo.CourseMsg;

import java.util.List;

public interface ItemMsgMapper {

    int insert(CourseMsg record);
    List<CourseMsg> getItemMsgList(CourseMsg courseMsg);


}