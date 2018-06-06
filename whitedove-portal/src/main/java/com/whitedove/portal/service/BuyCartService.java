package com.whitedove.portal.service;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.portal.pojo.CartItem;
import com.whitedove.portal.pojo.Item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/26 16:10
 */
public interface BuyCartService {

    WhiteDoveResult addCartItem(String itemId, int num, HttpServletRequest request, HttpServletResponse response);
    List<CartItem> getCartItemList(HttpServletRequest request, HttpServletResponse response);
    Item getCartItemList(String id , HttpServletRequest request, HttpServletResponse response);
    WhiteDoveResult deleteCartItem(String itemId, HttpServletRequest request, HttpServletResponse response);
    int getbuyCartNum(HttpServletRequest request, HttpServletResponse response);

}
