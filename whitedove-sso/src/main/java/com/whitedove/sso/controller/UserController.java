package com.whitedove.sso.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whitedove.common.utils.ExceptionUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.mapper.TbUserMapper;
import com.whitedove.pojo.TbUser;
import com.whitedove.sso.service.UserService;
import com.whitedove.sso.utils.RandomValidateCode;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;


/**
 * 用户Controller
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
    private TbUserMapper tbUserMapper;


	//创建用户
	@RequestMapping(value="/createuser", method=RequestMethod.POST)
	@ResponseBody
	public WhiteDoveResult createUser(TbUser user, @RequestParam("registerCode") String registerCode,HttpServletRequest request) {

        String code = request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase();

        WhiteDoveResult username = userService.checkData(user.getUsername(),1);
        WhiteDoveResult phone = userService.checkData(user.getPhone(),2);
        WhiteDoveResult email = userService.checkData(user.getEmail(),3);

        if (username.getStatus()==500 || "500".equals(username.getStatus())){
            return WhiteDoveResult.build(400,"该用户名已存在");
        }
        if (phone.getStatus()==500 || "500".equals(phone.getStatus())){
            return WhiteDoveResult.build(400,"该手机号已注册");
        }
        if (email.getStatus()==500 || "500".equals(email.getStatus())){
            return WhiteDoveResult.build(400,"该邮箱已注册");
        }
        if(!registerCode.toUpperCase().equals(code)){
            return WhiteDoveResult.build(400,"验证码错误");
        }
        try {
			WhiteDoveResult result = userService.createUser(user);

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return WhiteDoveResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
	
	//用户登录
	@RequestMapping(value="/userlogin", method=RequestMethod.POST)
	@ResponseBody
	public WhiteDoveResult userLogin(String username, String password,String randcode,
			HttpServletRequest request, HttpServletResponse response) {
        String code = request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase();
        if(!randcode.toUpperCase().equals(code)){
            return WhiteDoveResult.build(400,"验证码错误");
        }
		try {
			WhiteDoveResult result = userService.userLogin(username, password, request, response);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return WhiteDoveResult.build(400, ExceptionUtil.getStackTrace(e));
		}
	}
	
	@RequestMapping("/token/{token}")
	@ResponseBody
	public Object getUserByToken(@PathVariable String token, String callback, HttpServletRequest request,HttpServletResponse response) {
		WhiteDoveResult result = null;
		try {
			result = userService.getUserByToken(token);

		} catch (Exception e) {
			e.printStackTrace();
			result = WhiteDoveResult.build(400, ExceptionUtil.getStackTrace(e));
		}
		
		//判断是否为jsonp调用
		if (StringUtils.isBlank(callback)) {
			return result;
		} else {
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
	}
}