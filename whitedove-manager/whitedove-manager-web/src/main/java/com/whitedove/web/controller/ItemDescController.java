package com.whitedove.web.controller;



import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.web.service.ItemDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 学科描述Controller
 */
@Controller
@RequestMapping("/item/desc")
public class ItemDescController  {

    @Autowired
    private ItemDescService itemDescService;

    /**
     * 加载学科描述
     */
    @RequestMapping(value="/query/{itemId}")
    @ResponseBody
    private WhiteDoveResult getDescItem(@PathVariable Long itemId)throws Exception{
        WhiteDoveResult result = itemDescService.getItemDesc(itemId);
        return result;
    }
}
