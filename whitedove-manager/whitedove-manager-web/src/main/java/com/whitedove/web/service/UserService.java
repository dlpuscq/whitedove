package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbUser;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:28
 */
public interface UserService {
    EUDataGridResult getUserList(int page, int rows,String params);
    WhiteDoveResult updateUser(TbUser user)throws Exception;
    WhiteDoveResult deleteUser(Long id) throws Exception;
}
