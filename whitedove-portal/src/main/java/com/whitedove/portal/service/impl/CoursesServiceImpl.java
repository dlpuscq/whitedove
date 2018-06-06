package com.whitedove.portal.service.impl;


import com.github.pagehelper.PageHelper;
import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.JsonUtils;
import com.whitedove.mapper.TbItemCatMapper;

import com.whitedove.mapper.TbItemMsgMapper;
import com.whitedove.mapper.TbMyItemMapper;
import com.whitedove.pojo.*;
import com.whitedove.portal.dao.JedisClient;
import com.whitedove.portal.mapper.ItemMapper;


import com.whitedove.portal.pojo.*;
import com.whitedove.portal.service.CoursesService;
import com.whitedove.portal.service.UserService;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @Author: songcq
 * @Description: 学科目录service
 * @Date: Created in 2018/4/13 15:58
 */
@Service
public class CoursesServiceImpl implements CoursesService {

    @Autowired
    private JedisClient jedisClient;
    @Value("${INDEX_CAT_REDIS_KEY}")
    private String INDEX_CAT_REDIS_KEY;
    @Value("${REDIS_ITEM_KEY}")
    private String REDIS_ITEM_KEY;
    @Value("${REDIS_TEACHING_KEY}")
    private String REDIS_TEACHING_KEY;

    @Autowired
    private UserService userService;
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private TbItemCatMapper tbItemCatMapper;
    @Autowired
    private TbItemMsgMapper tbItemMsgMapper;
    @Autowired
    private TbMyItemMapper tbMyItemMapper;

    @Override
    public List<Item> queryItem(Long cid,Integer page) {
        Item item = new Item();
        item.setCid(cid);
        PageHelper.startPage(page, 6);
        List<Item> list = itemMapper.getItemList(item);
        //向缓存中添加内容
        try {
            //把list转换成字符串
            String cacheString = JsonUtils.objectToJson(list);
            jedisClient.hset(REDIS_ITEM_KEY,cid + "",cacheString);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //从缓存中取内容
        try {
            String result = jedisClient.hget(REDIS_ITEM_KEY,cid + "");
            if (!StringUtils.isBlank(result)) {
                //把字符串转换成list
                List<Item> resultList = JsonUtils.jsonToList(result, Item.class);
                return resultList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<TbItemCat> queryItemCat(Long id) {

        //创建查询条件
        TbItemCatExample example = new TbItemCatExample();
        TbItemCatExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(id);
        List<TbItemCat> tbItemCats =  tbItemCatMapper.selectByExample(example);

        return tbItemCats;
    }


    @Override
    public List<TbItemMsg> queryTbItemMsg(Long id) {

        TbItemMsgExample example = new TbItemMsgExample();
        TbItemMsgExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(id);
        List<TbItemMsg> tbItemMsgs = tbItemMsgMapper.selectByExample(example);
        return tbItemMsgs;
    }

    @Override
    public List<TbMyItem> queryMyItem(Long id, HttpServletRequest request) {

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbMyItemExample example = new TbMyItemExample();
        TbMyItemExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(user.getId());
        criteria.andItemIdEqualTo(id);
        List<TbMyItem> tbMyItems = tbMyItemMapper.selectByExample(example);
        return tbMyItems;
    }

}
