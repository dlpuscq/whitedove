package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.JsonUtils;
import com.whitedove.mapper.TbItemCatMapper;
import com.whitedove.portal.dao.JedisClient;
import com.whitedove.portal.pojo.Item;
import com.whitedove.pojo.TbItemCat;
import com.whitedove.pojo.TbItemCatExample;
import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.service.IndexService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: songcq
 * @Description: 页面加载Service
 * @Date: Created in 2018/4/13 16:28
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private TbItemCatMapper tbItemCatMapper;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private JedisClient jedisClient;

    @Value("${INDEX_CAT_REDIS_KEY}")
    private String INDEX_CAT_REDIS_KEY;

    @Value("${REDIS_ITEM_KEY}")
    private String REDIS_ITEM_KEY;

    /**
     *
     * @author songcq
     * @description 展示学科分类
     * @date 2018/4/18 17:49
     * @param [id]
     * @return java.util.List<com.whitedove.pojo.TbItemCat>
     */
    @Override
    public List<TbItemCat> queryCat(Long id) {

        //从缓冲中取内容
        try{
            String result = jedisClient.hget(INDEX_CAT_REDIS_KEY,id + "");
            if(!StringUtils.isBlank(result)){
                List<TbItemCat> resultList = JsonUtils.jsonToList(result,TbItemCat.class);
                return resultList;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        TbItemCatExample example = new TbItemCatExample();
        TbItemCatExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(id);
        List<TbItemCat> list = tbItemCatMapper.selectByExample(example);
        //向缓存中添加内容
        try{
            //把list转换成字符串
            String cacheString = JsonUtils.objectToJson(list);
            jedisClient.hset(INDEX_CAT_REDIS_KEY,id+"",cacheString);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    /**
     *
     * @author songcq
     * @description 展示学科列表
     * @date 2018/4/18 17:49
     * @param []
     * @return java.util.List<com.whitedove.portal.pojo.Item>
     */
    @Override
    public List<Item> queryItem() {

        //从缓存中取内容
        try {
            String result = jedisClient.get(REDIS_ITEM_KEY);
            if (!StringUtils.isBlank(result)) {
                //把字符串转换成list
                List<Item> resultList = JsonUtils.jsonToList(result, Item.class);
                return resultList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Item> list = itemMapper.getItemList();
        //向缓存中添加内容
        try {
            //把list转换成字符串
            String cacheString = JsonUtils.objectToJson(list);
            jedisClient.set(REDIS_ITEM_KEY,cacheString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
