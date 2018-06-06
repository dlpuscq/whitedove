package com.whitedove.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbUser;
import com.whitedove.web.mapper.UserMapper;
import com.whitedove.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description 用户管理service
 * @autoor Songcq
 * @date 2018/5/31 8:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TbUserMapper tbUserMapper;
    @Autowired
    private UserMapper userMapper;




    /**
     * 用户列表查询
     */
    @Override
    public EUDataGridResult getUserList(int page, int rows,String params) {
        TbUser tbUser = new TbUser();
        tbUser.setUsername(params);
        //分页处理
        PageHelper.startPage(page, rows);
        List<TbUser> list =userMapper.getUserList(tbUser);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<TbUser> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public WhiteDoveResult updateUser(TbUser user) throws Exception {
        user.setCreated(new Date());
        user.setUpdated(new Date());
        tbUserMapper.updateByPrimaryKeySelective(user);
        return WhiteDoveResult.ok();
    }

    /**
     * 删除用户
     */
    @Override
    public WhiteDoveResult deleteUser(Long userid) throws Exception {
        tbUserMapper.deleteByPrimaryKey(userid);
        return WhiteDoveResult.ok();
    }

}
