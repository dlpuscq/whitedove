package com.whitedove.web.pojo;

import lombok.Data;

import java.util.Date;
/**
 *
 * @author songcq
 * @description 教师实体类
 * @date 2018/4/18 19:57
 * @param
 * @return
 */
@Data
public class Teachers {

    private Long teacherId;

    private String teacherName;

    private String titleDesc;

    private String catId;

    private String catName;

    private String pic;

    private Date created;

    private Date updated;

}