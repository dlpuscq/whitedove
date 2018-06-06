package com.whitedove.mapper;

import com.whitedove.pojo.TbItemMsg;
import com.whitedove.pojo.TbItemMsgExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbItemMsgMapper {
    int countByExample(TbItemMsgExample example);

    int deleteByExample(TbItemMsgExample example);

    int deleteByPrimaryKey(Long itemId);

    int insert(TbItemMsg record);

    int insertSelective(TbItemMsg record);

    List<TbItemMsg> selectByExample(TbItemMsgExample example);

    TbItemMsg selectByPrimaryKey(Long itemId);

    int updateByExampleSelective(@Param("record") TbItemMsg record, @Param("example") TbItemMsgExample example);

    int updateByExample(@Param("record") TbItemMsg record, @Param("example") TbItemMsgExample example);

    int updateByPrimaryKeySelective(TbItemMsg record);

    int updateByPrimaryKey(TbItemMsg record);

    int subByPrimaryKey(TbItemMsg record);

    int addSalesByPrimaryKey(TbItemMsg record);
}