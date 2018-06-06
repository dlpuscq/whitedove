package com.whitedove.portal.service;

import com.whitedove.pojo.TbItemCat;
import com.whitedove.portal.pojo.Item;

import java.util.List;

public interface IndexService {
    List<TbItemCat> queryCat(Long id);
    List<Item> queryItem();
}
