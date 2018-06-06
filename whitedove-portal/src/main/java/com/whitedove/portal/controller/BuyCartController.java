package com.whitedove.portal.controller;

import com.whitedove.common.utils.ExceptionUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.portal.pojo.CartItem;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.service.BuyCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/26 15:29
 */
@Controller
public class BuyCartController {

    @Autowired
    private BuyCartService buyCartService;

    @RequestMapping("buycartshow")
    public String showCart(String id,HttpServletRequest request, HttpServletResponse response){
        Item itemList = buyCartService.getCartItemList(id,request,response);
        request.setAttribute("itemList",itemList);
        return "buycart";
    }

    @RequestMapping("buycartlist")
    public String showCartList(HttpServletRequest request, HttpServletResponse response){
        List<CartItem> itemList = buyCartService.getCartItemList(request,response);
        request.setAttribute("itemList",itemList);
        return "buycartlist";
    }

    @RequestMapping(value="/buycartadd", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult addCart(String itemid,HttpServletRequest request, HttpServletResponse response){

        try {
            WhiteDoveResult result = buyCartService.addCartItem(itemid,1,request,response);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return WhiteDoveResult.build(400, ExceptionUtil.getStackTrace(e));
        }
    }

    @RequestMapping("/delete/{itemId}")
    public String deleteCartItem(@PathVariable String itemId, HttpServletRequest request, HttpServletResponse response) {
        buyCartService.deleteCartItem(itemId, request, response);
        return "redirect:/buycartlist";
    }
}
