package com.whitedove.portal.mapper;

import com.whitedove.pojo.TbUser;
import com.whitedove.portal.pojo.MyReceive;

import java.util.List;

public interface MyReceiveMapper {
    List<MyReceive> getMyReceive(TbUser user);
}
