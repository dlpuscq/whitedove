package com.whitedove.web.controller;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.HttpClientUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbItem;
import com.whitedove.pojo.TbUser;
import com.whitedove.web.pojo.Teachers;
import com.whitedove.web.pojo.Teaching;
import com.whitedove.web.service.TeachersService;
import com.whitedove.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:27
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 查询学科并且分页显示
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("user/list")
    @ResponseBody
    public EUDataGridResult getItemList(Integer page, Integer rows,@RequestParam(value="params")String params){
        EUDataGridResult result = userService.getUserList(page, rows,params);
        return result;
    }


    /**
     * 修改用户
     */
    @RequestMapping(value="/user/update")
    @ResponseBody
    private WhiteDoveResult updateUser(TbUser user)throws Exception{
        WhiteDoveResult result = userService.updateUser(user);
        return result;
    }

    /**
     * 删除用户
     */
    @RequestMapping(value = "/user/delete")
    @ResponseBody
    private WhiteDoveResult deleteItem(HttpServletRequest request, HttpServletResponse response)throws Exception{
        BigInteger id = new BigInteger(request.getParameter("ids"));
        long itemid = id.longValue();
        WhiteDoveResult result = userService.deleteUser(itemid);
        return result;
    }

}
