package com.whitedove.portal.mapper;


import com.whitedove.pojo.TbOrderItem;


import java.util.List;

public interface CartItemMapper {
    List<TbOrderItem> getCatItemList(String[] itemids);
}
