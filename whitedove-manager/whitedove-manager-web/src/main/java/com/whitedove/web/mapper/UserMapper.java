package com.whitedove.web.mapper;

import com.whitedove.pojo.TbUser;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/6/1 10:17
 */
public interface UserMapper {
    List<TbUser> getUserList(TbUser tbUser);
}
