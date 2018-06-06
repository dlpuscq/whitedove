package com.whitedove.portal.service;

import com.whitedove.pojo.TbUser;


/**
 * @description
 * @autoor Songcq
 * @date 2018/5/24 14:31
 */
public interface UserService {
    TbUser getUserByToken(String token);
}
