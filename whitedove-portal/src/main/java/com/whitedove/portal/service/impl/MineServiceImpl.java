package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbUser;
import com.whitedove.portal.service.MineService;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/30 21:31
 */
@Service
public class MineServiceImpl implements MineService {

    @Autowired
    private UserService userService;
    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public WhiteDoveResult saveUser(TbUser tbUser, HttpServletRequest request) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        tbUser.setId(user.getId());
        tbUserMapper.updateByPrimaryKeySelective(tbUser);
        return WhiteDoveResult.ok();
    }
}
