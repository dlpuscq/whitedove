package com.whitedove.web.service;

import java.util.List;

import com.whitedove.common.pojo.EUTreeNode;


/**
 * @author 作者
 * @version 创建时间：2018年3月21日 上午10:54:49
 * 类说明
 */
public interface ItemCatService {

	List<EUTreeNode> getCatList(long parentId);

}
