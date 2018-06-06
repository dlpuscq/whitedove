package com.whitedove.portal.mapper;


import com.whitedove.portal.pojo.Item;

import java.util.List;

public interface ItemMapper {
    List<Item> getItemList();
    Item getItemById(Item item);
    List<Item> getItemRandom();
    List<Item> getItemHot();
	List<Item> getItemList(Item item);
    Long getItemNum(String cid);
}
