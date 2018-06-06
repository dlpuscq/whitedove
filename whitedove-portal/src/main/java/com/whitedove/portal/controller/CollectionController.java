package com.whitedove.portal.controller;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbCollectionMapper;
import com.whitedove.mapper.TbItemMsgMapper;
import com.whitedove.pojo.TbCollection;
import com.whitedove.pojo.TbCollectionExample;
import com.whitedove.pojo.TbItemMsg;
import com.whitedove.pojo.TbUser;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 21:21
 */
@Controller
public class CollectionController {

    @Autowired
    private TbCollectionMapper tbCollectionMapper;
    @Autowired
    private TbItemMsgMapper tbItemMsgMapper;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "iscollection", method=RequestMethod.GET)
    @ResponseBody
    public WhiteDoveResult isCollection(Long itemid, HttpServletRequest request, HttpServletResponse response){
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbCollectionExample example = new TbCollectionExample();
        TbCollectionExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemid);
        criteria.andUserIdEqualTo(user.getId());
        List<TbCollection> tbCollectionList = tbCollectionMapper.selectByExample(example);
        if (!tbCollectionList.isEmpty()){
            String flag = tbCollectionList.get(0).getIsCollection();
            if ("2".equals(flag)){
                return WhiteDoveResult.ok();
            }else {
                return WhiteDoveResult.build(500,"false");
            }
        }else {
            return WhiteDoveResult.build(500,"false");
        }
    }

    @RequestMapping(value = "collection", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult collection(Long itemid,String flag, HttpServletRequest request){
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbCollectionExample example = new TbCollectionExample();
        TbCollectionExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemid);
        criteria.andUserIdEqualTo(user.getId());
        List<TbCollection> tbCollectionList = tbCollectionMapper.selectByExample(example);
        TbCollection tbCollection = new TbCollection();
        try {
            //1是没有收藏
            if ("1".equals(flag)) {
                //查询是否收藏过
                if (tbCollectionList.isEmpty()) {
                    tbCollection.setItemId(itemid);
                    tbCollection.setUserId(user.getId());
                    tbCollection.setIsCollection("2");
                    tbCollectionMapper.insert(tbCollection);
                    addCol(itemid);
                    return WhiteDoveResult.ok("关注成功");
                } else {
                    tbCollection.setIsCollection("2");
                    tbCollectionMapper.updateByExampleSelective(tbCollection, example);
                    addCol(itemid);
                    return WhiteDoveResult.ok("关注成功");
                }
            } else {
                tbCollection.setIsCollection("1");
                tbCollectionMapper.updateByExampleSelective(tbCollection, example);
                subCol(itemid);
                return WhiteDoveResult.ok("取消关注成功");
            }
        }catch (Exception e) {
            return WhiteDoveResult.build(500,"false");
        }
    }
    public void addCol(Long itemid){
        TbItemMsg tbItemMsg = new TbItemMsg();
        tbItemMsg.setItemId(itemid);
        tbItemMsgMapper.updateByPrimaryKey(tbItemMsg);
    }
    public void subCol(Long itemid){
        TbItemMsg tbItemMsg = new TbItemMsg();
        tbItemMsg.setItemId(itemid);
        tbItemMsgMapper.subByPrimaryKey(tbItemMsg);

    }
}
