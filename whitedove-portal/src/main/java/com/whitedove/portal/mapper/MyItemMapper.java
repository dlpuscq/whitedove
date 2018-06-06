package com.whitedove.portal.mapper;

import com.whitedove.portal.pojo.MyItem;

import java.util.List;

public interface MyItemMapper {
    List<MyItem> getMyItemList(String[] itemids);
    int insert(MyItem record);
}
