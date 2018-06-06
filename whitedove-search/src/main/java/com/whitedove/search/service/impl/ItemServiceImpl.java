package com.whitedove.search.service.impl;

import com.whitedove.common.utils.ExceptionUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.search.mapper.ItemMapper;
import com.whitedove.search.pojo.Item;
import com.whitedove.search.service.ItemService;
import org.apache.solr.client.solrj.SolrServer;

import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	@Autowired
	private SolrServer solrServer;
	
	@Override
	public WhiteDoveResult importAllItems() {
		try {
			//查询学科列表
			List<Item> list = itemMapper.getItemList();
			//把学科信息写入索引库
			for (Item item : list) {
				//创建一个SolrInputDocument对象
				SolrInputDocument document = new SolrInputDocument();
				document.setField("id", item.getId());
				document.setField("item_title", item.getTitle());
				document.setField("item_sell_point", item.getSellPoint());
				document.setField("item_price", item.getPrice());
				document.setField("item_image", item.getImage());
				document.setField("item_cid", item.getCid());
				document.setField("item_category_name", item.getCategoryName());
				document.setField("item_desc", item.getItemDesc());
				//写入索引库
				solrServer.add(document);
			}
			//提交修改
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return WhiteDoveResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return WhiteDoveResult.ok();
	}

}
