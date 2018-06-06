package com.whitedove.sso.service.impl;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbUser;
import com.whitedove.pojo.TbUserExample;
import com.whitedove.sso.service.PasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 14:50
 */
@Service
public class PasswordServiceImpl implements PasswordService {

    @Autowired
    private TbUserMapper tbUserMapper;
    @Override
    public WhiteDoveResult checkPwd(String email) {

        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        List<TbUser> list = tbUserMapper.selectByExample(example);
        //如果没有此邮箱
        if (null == list || list.size() == 0) {
            return WhiteDoveResult.build(400, "该邮箱未注册");
        }
        return WhiteDoveResult.ok(email);
    }
}
