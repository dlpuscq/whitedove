package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.JsonUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbUser;
import com.whitedove.portal.dao.JedisClient;
import com.whitedove.portal.mapper.ItemMapper;
import com.whitedove.portal.pojo.CartItem;
import com.whitedove.portal.pojo.Item;
import com.whitedove.portal.service.BuyCartService;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;


/**
 * @description
 * @autoor Songcq
 * @date 2018/5/26 16:11
 */
@Service
public class BuyCartServiceImpl implements BuyCartService {

    @Autowired
    private UserService userService;
    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private JedisClient jedisClient;
    @Value("${SESSION_CART_REDIS_KEY}")
    private String SESSION_CART_REDIS_KEY;

    @Override
    public WhiteDoveResult addCartItem(String itemId, int num, HttpServletRequest request, HttpServletResponse response) {

        CartItem cartItem = null;

        List<CartItem> itemList = getCartItemList(request);
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");

        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);

        //判断购物车学科列表中是否存在此学科
        for (CartItem cItem : itemList) {
            //如果存在此学科
            if (cItem.getUsername().equals(user.getUsername())&&cItem.getId().equals(itemId)) {
                    return WhiteDoveResult.build(400, "false");
            }
        }
        //根据学科id查询基本信息
        Item i = new Item();
        i.setId(itemId);
        Item item = itemMapper.getItemById(i);
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setId(item.getId());
            cartItem.setTitle(item.getTitle());
            cartItem.setImage(item.getImage() == null ? "" : item.getImage().split(",")[0]);
            cartItem.setNum(num);
            cartItem.setPrice(item.getPrice());
            cartItem.setUsername(user.getUsername());
            cartItem.setUserid(user.getId());
            itemList.add(cartItem);
        }
        jedisClient.set(SESSION_CART_REDIS_KEY + ":" + user.getId() + ":base", JsonUtils.objectToJson(itemList));

        return WhiteDoveResult.ok(cartItem);
    }

    /**
     * 从cookie中取购物车列表
     */
    private List<CartItem> getCartItemList(HttpServletRequest request) {

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");

        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        //从cookie中取学科列表

        String cartJson = jedisClient.get(SESSION_CART_REDIS_KEY + ":" + user.getId() + ":base");
        if (cartJson == null) {
            return new ArrayList<>();
        }
        //把json转换成学科列表
        try {
            List<CartItem> list = JsonUtils.jsonToList(cartJson, CartItem.class);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    @Override
    public List<CartItem> getCartItemList(HttpServletRequest request, HttpServletResponse response) {
        List<CartItem> itemList = getCartItemList(request);
        List item = new ArrayList<CartItem>();
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        if (!itemList.isEmpty()) {
            for (int i = 0; i < itemList.size(); i++) {
                if (user.getUsername().equals(itemList.get(i).getUsername())) {
                    CartItem cartItem = itemList.get(i);
                    item.add(cartItem);
                }
            }
            return item;
        }
        return null;
    }

    @Override
    public Item getCartItemList(String id , HttpServletRequest request, HttpServletResponse response) {
        Item item = new Item();
        item.setId(id);
        Item it = itemMapper.getItemById(item);
        return it;
    }

    @Override
    public WhiteDoveResult deleteCartItem(String itemId, HttpServletRequest request, HttpServletResponse response) {

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        //从cookie中取购物车学科列表
        List<CartItem> itemList = getCartItemList(request);
        //从列表中找到此学科
        for (CartItem cartItem : itemList) {
            if (cartItem.getId().equals(itemId)) {
                itemList.remove(cartItem);
                break;
            }
        }
        jedisClient.set(SESSION_CART_REDIS_KEY + ":" + user.getId() + ":base", JsonUtils.objectToJson(itemList));
        //把购物车列表重新写入cookie
        return WhiteDoveResult.ok();
    }

    @Override
    public int getbuyCartNum(HttpServletRequest request, HttpServletResponse response) {
        List<CartItem> itemList = getCartItemList(request);
        int num = 0;
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        if (!itemList.isEmpty()) {
            for (int i = 0; i < itemList.size(); i++) {
                if (user.getUsername().equals(itemList.get(i).getUsername())) {
                    num++;
                }
            }
            return num;
        }
        return 0;
    }

}
