package com.whitedove.web.mapper;

import com.whitedove.web.pojo.Teaching;

public interface TeachingMapper {
    int insert(Teaching record);
    Teaching getCatName(Teaching teaching);
}