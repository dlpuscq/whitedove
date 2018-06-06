package com.whitedove.mapper;

import com.whitedove.pojo.TbTeachers;
import com.whitedove.pojo.TbTeachersExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbTeachersMapper {
    int countByExample(TbTeachersExample example);

    int deleteByExample(TbTeachersExample example);

    int deleteByPrimaryKey(Long teacherId);

    int insert(TbTeachers record);

    int insertSelective(TbTeachers record);

    List<TbTeachers> selectByExample(TbTeachersExample example);

    TbTeachers selectByPrimaryKey(Long teacherId);

    int updateByExampleSelective(@Param("record") TbTeachers record, @Param("example") TbTeachersExample example);

    int updateByExample(@Param("record") TbTeachers record, @Param("example") TbTeachersExample example);

    int updateByPrimaryKeySelective(TbTeachers record);

    int updateByPrimaryKey(TbTeachers record);
}