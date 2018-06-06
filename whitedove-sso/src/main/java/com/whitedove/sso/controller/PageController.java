package com.whitedove.sso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转Controller
 */
@Controller
public class PageController {

	@RequestMapping("/register")
	public String showRegister() {
		return "register";
	}

	@RequestMapping("/login")
	public String showLogin(String redirect, Model model) {
		model.addAttribute("redirect", redirect);
		return "login";
	}

	@RequestMapping("/forgetPassword")
	public String forgetPassword() {
		return "forgetpassword";
	}
}
