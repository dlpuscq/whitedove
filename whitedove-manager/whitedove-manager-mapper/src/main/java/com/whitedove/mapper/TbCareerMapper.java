package com.whitedove.mapper;

import com.whitedove.pojo.TbCareer;
import com.whitedove.pojo.TbCareerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCareerMapper {
    int countByExample(TbCareerExample example);

    int deleteByExample(TbCareerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbCareer record);

    int insertSelective(TbCareer record);

    List<TbCareer> selectByExample(TbCareerExample example);

    TbCareer selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbCareer record, @Param("example") TbCareerExample example);

    int updateByExample(@Param("record") TbCareer record, @Param("example") TbCareerExample example);

    int updateByPrimaryKeySelective(TbCareer record);

    int updateByPrimaryKey(TbCareer record);
}