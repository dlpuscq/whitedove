package com.whitedove.web.service.impl;

import java.util.Date;
import java.util.List;

import com.whitedove.mapper.TbItemDescMapper;
import com.whitedove.mapper.TbItemMapper;
import com.whitedove.mapper.TbItemParamItemMapper;

import com.whitedove.pojo.*;
import com.whitedove.web.mapper.ItemMsgMapper;
import com.whitedove.web.pojo.CourseMsg;
import com.whitedove.web.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.IDUtils;
import com.whitedove.common.utils.WhiteDoveResult;


/**
 * 学科管理Service
 */
@SuppressWarnings("SpellCheckingInspection")
@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper itemMapper;
	
	@Autowired
	private TbItemDescMapper itemDescMapper;
	
	@Autowired
	private TbItemParamItemMapper itemParamItemMapper;

	@Autowired
    private ItemMsgMapper tbItemMsgMapper;

	@Override
	public WhiteDoveResult getItemById(long itemId) {

		//添加查询条件
		TbItemExample example = new TbItemExample();
		TbItemExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> list = itemMapper.selectByExample(example);
		WhiteDoveResult result = new WhiteDoveResult();
		if (list != null && list.size() > 0) {
			TbItem item = list.get(0);
			result.setData(item);
			return result;
		}
		return result;
	}

	/**
	 * 学科列表查询
	 */
	@Override
	public EUDataGridResult getItemList(int page, int rows) {
		//查询学科列表
		TbItemExample example = new TbItemExample();
		//分页处理
		PageHelper.startPage(page, rows);
		List<TbItem> list = itemMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public WhiteDoveResult createItem(TbItem item, String desc, String itemParam) throws Exception {
		//item补全
		//生成学科ID
		Long itemId = IDUtils.genItemId();
		item.setId(itemId);
		//学科状态，1-正常，2-下架
		item.setStatus((byte) 1);
		item.setCreated(new Date());
		item.setUpdated(new Date());
		//插入到数据库
		itemMapper.insert(item);
        CourseMsg courseMsg = new CourseMsg();
        courseMsg.setItemId(itemId);
        courseMsg.setItemCollection("0");
        courseMsg.setSales("0");
        tbItemMsgMapper.insert(courseMsg);
		//添加学科描述信息
		WhiteDoveResult result = insertItemDesc(itemId, desc);
		if (result.getStatus() != 200) {
			throw new Exception();
		}
		//添加规格参数
		result = insertItemParamItem(itemId, itemParam);
		if (result.getStatus() != 200) {
			throw new Exception();
		}
		return WhiteDoveResult.ok();
	}
	
	/**
	 * 修改学科
	 */
	@Override
	public WhiteDoveResult updateItem(TbItem item, String desc, String itemParam) throws Exception {
		item.setStatus((byte) 1);
		item.setCreated(new Date());
		item.setUpdated(new Date());
		itemMapper.updateByPrimaryKeySelective(item);

        //修改学科描述信息
        WhiteDoveResult result = updateItemDesc(item.getId(), desc);
        if (result.getStatus() != 200) {
            throw new Exception();
        }
        //修改课时参数
        result = updateItemParamItem(item.getId(), itemParam);
        if (result.getStatus() != 200) {
            throw new Exception();
        }
		return WhiteDoveResult.ok();
	}

	/**
	 * 添加学科描述
	 */
	private WhiteDoveResult insertItemDesc(Long itemId, String desc) {
		TbItemDesc itemDesc = new TbItemDesc();
		itemDesc.setItemId(itemId);
		itemDesc.setItemDesc(desc);
		itemDesc.setCreated(new Date());
		itemDesc.setUpdated(new Date());
		itemDescMapper.insert(itemDesc);
		return WhiteDoveResult.ok();
	}

	/**
	 * 添加规格参数
	 */
	private WhiteDoveResult insertItemParamItem(Long itemId, String itemParam) {
		//创建一个pojo
		TbItemParamItem itemParamItem = new TbItemParamItem();
		itemParamItem.setItemId(itemId);
		itemParamItem.setParamData(itemParam);
		itemParamItem.setCreated(new Date());
		itemParamItem.setUpdated(new Date());
		//向表中插入数据
		itemParamItemMapper.insert(itemParamItem);
		return WhiteDoveResult.ok();
		
	}

    /**
     * 修改学科描述
     */
    private WhiteDoveResult updateItemDesc(Long itemId, String desc) {
        TbItemDescExample example = new TbItemDescExample();
        TbItemDescExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemId);
        TbItemDesc itemDesc = new TbItemDesc();
        itemDesc.setItemDesc(desc);
        itemDesc.setUpdated(new Date());
        itemDescMapper.updateByExampleSelective(itemDesc,example);
        return WhiteDoveResult.ok();
    }

    /**
     * 修改规格参数
     */
    private WhiteDoveResult updateItemParamItem(Long itemId, String itemParam) {
        TbItemParamItemExample example = new TbItemParamItemExample();
        TbItemParamItemExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemId);
        //创建一个pojo
        TbItemParamItem itemParamItem = new TbItemParamItem();
        itemParamItem.setParamData(itemParam);
        itemParamItem.setUpdated(new Date());
        //向表中插入数据
        itemParamItemMapper.updateByExampleSelective(itemParamItem,example);
        return WhiteDoveResult.ok();

    }

	@Override
	public WhiteDoveResult deleteItem(Long itemId) throws Exception {
        itemMapper.deleteByPrimaryKey(itemId);
		return WhiteDoveResult.ok();
	}

    /**
     * 上架学科
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public WhiteDoveResult reshelfItem(Long id) throws Exception {
        TbItem tbItem = itemMapper.selectByPrimaryKey(id);
        // 学科状态，1-正常，2-下架
        tbItem.setStatus((byte) 1);
        tbItem.setCreated(new Date());
        tbItem.setUpdated(new Date());
        itemMapper.updateByPrimaryKeySelective(tbItem);
        return WhiteDoveResult.ok();
    }

    /**
     * 下架学科
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public WhiteDoveResult instockItem(Long id) throws Exception {
        TbItem tbItem = itemMapper.selectByPrimaryKey(id);
        // 学科状态，1-正常，2-下架
        tbItem.setStatus((byte) 2);
        tbItem.setCreated(new Date());
        tbItem.setUpdated(new Date());
        itemMapper.updateByPrimaryKeySelective(tbItem);
        return WhiteDoveResult.ok();
    }

}
