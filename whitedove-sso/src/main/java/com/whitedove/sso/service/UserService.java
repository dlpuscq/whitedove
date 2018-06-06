package com.whitedove.sso.service;

import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface UserService {

	WhiteDoveResult checkData(String content, Integer type);
	WhiteDoveResult createUser(TbUser user);
	WhiteDoveResult userLogin(String username, String password, HttpServletRequest request, HttpServletResponse response);
	WhiteDoveResult getUserByToken(String token);

}
