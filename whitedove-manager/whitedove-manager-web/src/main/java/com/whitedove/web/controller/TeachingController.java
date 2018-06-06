package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUTreeNode;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbItemCatMapper;
import com.whitedove.mapper.TbTeachingMapper;
import com.whitedove.pojo.TbItemCat;
import com.whitedove.pojo.TbTeaching;
import com.whitedove.web.mapper.TeachingMapper;
import com.whitedove.web.service.TeachingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 课程节点分类管理
 */
@Controller
@RequestMapping("/teaching")
public class TeachingController {

    @Autowired
    private TeachingService teachingService;
    @Autowired
    private TbItemCatMapper tbItemCatMapper;

    /**
     *
     * @author songcq
     * @description 显示教学学科节点
     * @date 2018/4/18 17:43
     * @param [parentId]
     * @return java.util.List<com.whitedove.common.pojo.EUTreeNode>
     */
    @RequestMapping("/list")
    @ResponseBody
    public List<EUTreeNode> getItemCatList(@RequestParam(value="id", defaultValue="0")Long parentId) {
        List<EUTreeNode> list = teachingService.getTeachingList(parentId);
        return list;
    }
    /**
     * @description  添加二级学科
     * @author Songcq
     * @date 2018/5/25 13:52
     * @param [parentId, name]
     * @return TaotaoResult
     */
    @RequestMapping("/create")
    @ResponseBody
    public WhiteDoveResult createItemCategory(Long parentId, String name) {
        WhiteDoveResult result = teachingService.insertTeaching(parentId, name);
        return result;
    }

    /**
     * @description  修改节点
     */
    @RequestMapping("/update")
    @ResponseBody
    public WhiteDoveResult updateItemCategory(Long id, String name) {
        WhiteDoveResult result = teachingService.updateTeaching(id, name);
        return result;
    }

    /**
     * @description  删除节点
     */
    @RequestMapping("/delete")
    @ResponseBody
    public WhiteDoveResult deleteItemCategory(Long id) {
        TbItemCat tbItemCat = tbItemCatMapper.selectByPrimaryKey(id);
        Long parentId = tbItemCat.getParentId();
        WhiteDoveResult result = teachingService.deleteTeaching(parentId, id);
        return result;
    }
}
