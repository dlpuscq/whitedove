package com.whitedove.portal.service;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbUser;

import javax.servlet.http.HttpServletRequest;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/30 21:30
 */

public interface MineService {
    WhiteDoveResult saveUser(TbUser tbUser, HttpServletRequest request);
}
