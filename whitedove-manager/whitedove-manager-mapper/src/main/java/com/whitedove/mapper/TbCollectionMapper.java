package com.whitedove.mapper;

import com.whitedove.pojo.TbCollection;
import com.whitedove.pojo.TbCollectionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCollectionMapper {
    int countByExample(TbCollectionExample example);

    int deleteByExample(TbCollectionExample example);

    int insert(TbCollection record);

    int insertSelective(TbCollection record);

    List<TbCollection> selectByExample(TbCollectionExample example);

    int updateByExampleSelective(@Param("record") TbCollection record, @Param("example") TbCollectionExample example);

    int updateByExample(@Param("record") TbCollection record, @Param("example") TbCollectionExample example);
}