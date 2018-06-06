package com.whitedove.web.service.impl;

import com.whitedove.common.pojo.EUTreeNode;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbItemCatMapper;
import com.whitedove.pojo.*;
import com.whitedove.web.service.TeachingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 教师教学内容管理
 */
@Service
public class TeachingServiceImpl implements TeachingService {

    @Autowired
    private TbItemCatMapper tbItemCatMapper;

    @Override
    public List<EUTreeNode> getTeachingList(long parentId) {
        //根据parentid查询节点列表
        TbItemCatExample example = new TbItemCatExample();
        TbItemCatExample.Criteria criteria =example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        //执行查询
        List<TbItemCat> list = tbItemCatMapper.selectByExample(example);
        List<EUTreeNode> resultList = new ArrayList<>();

        for (TbItemCat tbItemCat : list) {
            //创建一个节点
            EUTreeNode node = new EUTreeNode();
            node.setId(tbItemCat.getId());
            node.setText(tbItemCat.getName());
            node.setState(tbItemCat.getIsParent()?"closed":"open");
            resultList.add(node);
        }
        return resultList;
    }

    @Override
    public WhiteDoveResult insertTeaching(long parentId, String name) {
        //创建一个pojo
        TbItemCat tbItemCat = new TbItemCat();
        tbItemCat.setName(name);
        tbItemCat.setIsParent(false);
        //'状态。可选值:1(正常),2(删除)',
        tbItemCat.setStatus(1);
        tbItemCat.setParentId(parentId);
        tbItemCat.setSortOrder(1);
        tbItemCat.setCreated(new Date());
        tbItemCat.setUpdated(new Date());
        //添加记录
        tbItemCatMapper.insert(tbItemCat);
        //查看父节点的isParent列是否为true，如果不是true改成true
        TbItemCat parentCat = tbItemCatMapper.selectByPrimaryKey(parentId);
        //判断是否为true

        if(!parentCat.getIsParent()) {
            parentCat.setIsParent(true);
            //更新父节点
            tbItemCatMapper.updateByPrimaryKey(parentCat);
        }
        //返回结果
        return WhiteDoveResult.ok(tbItemCat);
    }

    @Override
    public WhiteDoveResult deleteTeaching(long parentId, Long id) {

        tbItemCatMapper.deleteByPrimaryKey(id);
        //根据parentid查询节点列表
        TbItemCatExample example = new TbItemCatExample();
        TbItemCatExample.Criteria criteria =example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        TbItemCat tbItemCat = new TbItemCat();
        //执行查询
        List<TbItemCat> list = tbItemCatMapper.selectByExample(example);
        if (list.isEmpty()){
            TbItemCatExample example1 = new TbItemCatExample();
            TbItemCatExample.Criteria criteria1 =example1.createCriteria();
            criteria1.andIdEqualTo(parentId);
            tbItemCat.setIsParent(false);
            tbItemCatMapper.updateByExampleSelective(tbItemCat,example1);
        }
        return WhiteDoveResult.ok(tbItemCat);
    }

    @Override
    public WhiteDoveResult updateTeaching(long id, String name) {

        //创建一个pojo
        TbItemCat tbItemCat = new TbItemCat();
        tbItemCat.setId(id);
        tbItemCat.setName(name);
        tbItemCat.setUpdated(new Date());
        //修改记录
        tbItemCatMapper.updateByPrimaryKeySelective(tbItemCat);
        //返回结果
        return WhiteDoveResult.ok(tbItemCat);
    }
}
