package com.whitedove.mapper;

import com.whitedove.pojo.TbMyItem;
import com.whitedove.pojo.TbMyItemExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbMyItemMapper {
    int countByExample(TbMyItemExample example);

    int deleteByExample(TbMyItemExample example);

    int insert(TbMyItem record);

    int insertSelective(TbMyItem record);

    List<TbMyItem> selectByExample(TbMyItemExample example);

    int updateByExampleSelective(@Param("record") TbMyItem record, @Param("example") TbMyItemExample example);

    int updateByExample(@Param("record") TbMyItem record, @Param("example") TbMyItemExample example);
}