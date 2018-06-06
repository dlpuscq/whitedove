package com.whitedove.portal.service;



import com.whitedove.pojo.TbItemCat;
import com.whitedove.pojo.TbItemMsg;
import com.whitedove.pojo.TbMyItem;
import com.whitedove.portal.pojo.Item;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @Author: songcq
 * @Description:
 * @Date: Created in 2018/4/13 15:57
 */
public interface CoursesService {

    List<Item> queryItem(Long cid,Integer page);
    List<TbItemCat> queryItemCat(Long id);
    List<TbItemMsg> queryTbItemMsg(Long id);
    List<TbMyItem> queryMyItem(Long id, HttpServletRequest request);
}
