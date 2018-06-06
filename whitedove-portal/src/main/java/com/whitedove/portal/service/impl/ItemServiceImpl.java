package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.JsonUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbItemDescMapper;
import com.whitedove.mapper.TbItemMapper;
import com.whitedove.mapper.TbItemParamItemMapper;
import com.whitedove.pojo.*;
import com.whitedove.portal.dao.JedisClient;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.service.ItemService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: songcq
 * @Description: 学科管理Service
 * @Date: Created in 2018/4/16 14:42
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private TbItemMapper tbItemMapper;

    @Autowired
    private TbItemDescMapper tbItemDescMapper;

    @Autowired
    private TbItemParamItemMapper tbItemParamItemMapper;

    @Value("${INDEX_REDIS_KEY}")
    private String INDEX_REDIS_KEY;
    @Value("${INDEX_DESC_REDIS_KEY}")
    private String INDEX_DESC_REDIS_KEY;
    @Value("${INDEX_PARAM_REDIS_KEY}")
    private String INDEX_PARAM_REDIS_KEY;
    @Value("${REDIS_ITEM_EXPIRE}")
    private Integer REDIS_ITEM_EXPIRE;
    @Autowired
    private JedisClient jedisClient;

    @Override
    public List<TbItem> getItemById(Long itemId) {

        try {
            //添加缓存逻辑
            //从缓存中取学科信息，学科id对应的信息
            String json = jedisClient.get(INDEX_REDIS_KEY + ":" + itemId + ":base");
            //判断是否有值
            if (!StringUtils.isBlank(json)) {
                //把json转换成java对象
                List<TbItem> resultList = JsonUtils.jsonToList(json, TbItem.class);
                return resultList;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        TbItemExample example = new TbItemExample();
        TbItemExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(itemId);
        List<TbItem> tbItem =  tbItemMapper.selectByExample(example);
        try {
            //把学科信息写入缓存
            jedisClient.set(INDEX_REDIS_KEY + ":" + itemId + ":base", JsonUtils.objectToJson(tbItem));
            //设置key的有效期
            jedisClient.expire(INDEX_REDIS_KEY + ":" + itemId + ":base", REDIS_ITEM_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tbItem;
    }

    @Override
    public List<TbItemDesc> getItemDescById(Long itemId) {
        try {
            //添加缓存逻辑
            //从缓存中取学科信息，学科id对应的信息
            String json = jedisClient.get(INDEX_REDIS_KEY + ":" + itemId + ":desc");
            //判断是否有值
            if (!StringUtils.isBlank(json)) {
                //把json转换成java对象
                List<TbItemDesc> resultList = JsonUtils.jsonToList(json, TbItemDesc.class);
                return resultList;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        TbItemDescExample example1 = new TbItemDescExample();
        TbItemDescExample.Criteria criteria1 = example1.createCriteria();
        criteria1.andItemIdEqualTo(itemId);
        List<TbItemDesc> tbItemDescs = tbItemDescMapper.selectByExampleWithBLOBs(example1);

        try {
            //把学科信息写入缓存
            jedisClient.set(INDEX_REDIS_KEY + ":" + itemId + ":desc", JsonUtils.objectToJson(tbItemDescs));
            //设置key的有效期
            jedisClient.expire(INDEX_REDIS_KEY + ":" + itemId + ":desc", REDIS_ITEM_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tbItemDescs;
    }

    @Override
    public List<TbItemParamItem> getItemParamItem(Long itemId) {
        try {
            //添加缓存逻辑
            //从缓存中取学科信息，学科id对应的信息
            String json = jedisClient.get(INDEX_REDIS_KEY + ":" + itemId + ":param");
            //判断是否有值

            if (!StringUtils.isBlank(json)) {
                //把json转换成java对象
                List<TbItemParamItem> paramItem = JsonUtils.jsonToList(json, TbItemParamItem.class);
                return paramItem;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        TbItemParamItemExample example1 = new TbItemParamItemExample();
        TbItemParamItemExample.Criteria criteria1 = example1.createCriteria();
        criteria1.andItemIdEqualTo(itemId);
        List<TbItemParamItem> tbItemParamItems = tbItemParamItemMapper.selectByExampleWithBLOBs(example1);
            try {
                //把学科信息写入缓存
                jedisClient.set(INDEX_REDIS_KEY + ":" + itemId + ":param", JsonUtils.objectToJson(tbItemParamItems));
                //设置key的有效期
                jedisClient.expire(INDEX_REDIS_KEY + ":" + itemId + ":param", REDIS_ITEM_EXPIRE);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return tbItemParamItems;
    }

    @Override
    public String getItemParam(Long itemId) {
        try {
            List<TbItemParamItem> params = getItemParamItem(itemId);
            String paramData = params.get(0).getParamData();
                //生成html
                // 把课时参数json数据转换成java对象

            List<Map> jsonList = JsonUtils.jsonToList(paramData, Map.class);
            StringBuffer sb = new StringBuffer();
            sb.append("<div class=\"lab-item \">\n");
            for(Map m1:jsonList) {
                sb.append(" <div class=\"lab-item-status\">"+m1.get("group")+"</div>\n");
                sb.append("<br>");
                List<Map> list2 = (List<Map>) m1.get("params");
                for(Map m2:list2) {
                    sb.append("<div class=\"lab-item-status\">\n");
                    sb.append("<img src=\"images/lab-not-ok.png\">\n");
                    sb.append("</div>\n");
                    sb.append("<div class=\"lab-item-index\">"+m2.get("k")+" </div>\n");
                    sb.append("<div class=\"lab-item-title\">"+m2.get("v")+"</div>\n");
                    sb.append("<br>");
                }
            }
            sb.append("</div>");

            //返回html片段
                return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


}
