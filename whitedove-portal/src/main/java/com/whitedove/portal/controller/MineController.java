package com.whitedove.portal.controller;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbMyItemMapper;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbMyItem;
import com.whitedove.pojo.TbMyItemExample;
import com.whitedove.pojo.TbUser;
import com.whitedove.pojo.TbUserExample;
import com.whitedove.portal.mapper.MyReceiveMapper;
import com.whitedove.portal.mapper.OrderMapper;
import com.whitedove.portal.pojo.MyReceive;
import com.whitedove.portal.pojo.UserOrder;
import com.whitedove.portal.service.MineService;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;


/**
 * @description
 * @autoor Songcq
 * @date 2018/5/30 12:44
 */
@Controller
public class MineController {

    @Autowired
    private UserService userService;
    @Autowired
    private MineService mineService;
    @Autowired
    private TbUserMapper tbUserMapper;
    @Autowired
    private TbMyItemMapper tbMyItemMapper;
    @Autowired
    private MyReceiveMapper myReceiveMapper;
    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("/mine")
    public String showCompanys(HttpServletRequest request,@RequestParam(value = "status", required = false,defaultValue = "1")String status) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbUser tbUser = tbUserMapper.selectByPrimaryKey(user.getId());
        UserOrder userOrder0 = new UserOrder();
        UserOrder userOrder1 = new UserOrder();
        userOrder0.setStatus("1");
        userOrder0.setUserId(user.getId());
        userOrder1.setStatus("2");
        userOrder1.setUserId(user.getId());
        Long s1 = orderMapper.getOrderNum(userOrder0);
        Long s0 = orderMapper.getOrderNum(userOrder1);
        request.setAttribute("s1",s1);
        request.setAttribute("s0",s0);
        request.setAttribute("user",tbUser);
        return "mine";
    }

    @RequestMapping("/mymessage")
    public String myMessage(HttpServletRequest request,@RequestParam(value = "userid", required = false,defaultValue = "1")Long userid) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbUser tbUser = tbUserMapper.selectByPrimaryKey(user.getId());
        request.setAttribute("user",tbUser);

        return "mymessage";
    }

    @RequestMapping("/changepwd")
    public String changepwd(HttpServletRequest request,@RequestParam(value = "userid", required = false,defaultValue = "1")Long userid) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        TbUser tbUser = tbUserMapper.selectByPrimaryKey(user.getId());
        request.setAttribute("user",tbUser);
        return "changepwd";
    }

    @RequestMapping("/mycourses")
    public String myCourses(HttpServletRequest request,@RequestParam(value = "status", required = false,defaultValue = "1")String status) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        if("1".equals(status)){
            TbMyItemExample example = new TbMyItemExample();
            TbMyItemExample.Criteria criteria = example.createCriteria();
            criteria.andUserIdEqualTo(user.getId());
            List<TbMyItem> tbMyItemList = tbMyItemMapper.selectByExample(example);
            request.setAttribute("myItemList",tbMyItemList);
            request.setAttribute("flag","1");
        }else {
            List<MyReceive> myReceiveList = myReceiveMapper.getMyReceive(user);
            request.setAttribute("myItemList",myReceiveList);
            request.setAttribute("flag","2");
        }
        return "mycourses";
    }

    @RequestMapping(value="/saveuser", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult createUser(String username,String email,
                                      String phone,HttpServletRequest request,String headPichide) {

        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user0 = userService.getUserByToken(token);
        Long userid = user0.getId();
        TbUser user1 = tbUserMapper.selectByPrimaryKey(user0.getId());
        if (user0.getHeadpic()!=null){
            if (user1.getPhone().equals(phone) && user1.getEmail().equals(email) && user1.getHeadpic().equals(headPichide)){
                return WhiteDoveResult.ok("用户未做修改！");
            }
        }
        WhiteDoveResult tel = checkData(userid,phone,1);
        WhiteDoveResult mail = checkData(userid,email,2);

        if (tel.getStatus()==500 || "500".equals(tel.getStatus())){
            return WhiteDoveResult.build(400,"该手机号已绑定别的账号");
        }
        if (mail.getStatus()==500 || "500".equals(mail.getStatus())){
            return WhiteDoveResult.build(400,"该邮箱已绑定别的账号");
        }else {
            TbUser user = new TbUser();
            user.setEmail(email);
            user.setPhone(phone);
            user.setHeadpic(headPichide);
            mineService.saveUser(user,request);
        }
        return WhiteDoveResult.ok("修改成功！");
    }

    public WhiteDoveResult checkData(Long id ,String content, Integer type) {

        //创建查询条件
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andIdNotEqualTo(id);
        //对数据进行校验：1、2分别代表phone、email
        //电话校验
        if (1 == type) {
            criteria.andPhoneEqualTo(content);
         //email校验
        } else if ( 2 == type) {
            criteria.andEmailEqualTo(content);
        }
        //执行查询
        List<TbUser> list = tbUserMapper.selectByExample(example);
        if (list == null || list.size() == 0) {
            return  WhiteDoveResult.ok();
        }
        return WhiteDoveResult.build(500,"false");
    }

    @RequestMapping(value="/savepwd", method=RequestMethod.POST)
    @ResponseBody
    public WhiteDoveResult savePwd(String oldpassword,String password,
                                      String rePassword,HttpServletRequest request) {
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        TbUser user = userService.getUserByToken(token);
        Long userid = user.getId();
        TbUser user1 = tbUserMapper.selectByPrimaryKey(userid);
        if (!DigestUtils.md5DigestAsHex(oldpassword.getBytes()).equals(user1.getPassword())) {
            return WhiteDoveResult.build(400, "密码不正确！");
        }else {
            user1.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            Date date = new Date();
            user.setUpdated(date);
            tbUserMapper.updateByPrimaryKeySelective(user1);
            return WhiteDoveResult.ok("修改成功！");
        }
    }
}
