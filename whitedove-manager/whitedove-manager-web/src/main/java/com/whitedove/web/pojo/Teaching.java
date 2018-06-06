package com.whitedove.web.pojo;

import lombok.Data;

/**
 *
 * @author songcq
 * @description 教师教学科目实体类
 * @date 2018/4/18 19:58
 * @param
 * @return
 */
@Data
public class Teaching {
    private Long id;

    private Integer catId;

    private String catName;

    private Integer status;

    private Long teacherId;

    private String teacherName;

}