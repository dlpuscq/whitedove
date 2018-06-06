package com.whitedove.mapper;

import com.whitedove.pojo.TbTeaching;
import com.whitedove.pojo.TbTeachingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbTeachingMapper {
    int countByExample(TbTeachingExample example);

    int deleteByExample(TbTeachingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbTeaching record);

    int insertSelective(TbTeaching record);

    List<TbTeaching> selectByExample(TbTeachingExample example);

    TbTeaching selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbTeaching record, @Param("example") TbTeachingExample example);

    int updateByExample(@Param("record") TbTeaching record, @Param("example") TbTeachingExample example);

    int updateByPrimaryKeySelective(TbTeaching record);

    int updateByPrimaryKey(TbTeaching record);
}