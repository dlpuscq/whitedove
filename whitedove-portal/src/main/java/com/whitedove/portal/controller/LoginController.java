package com.whitedove.portal.controller;

import com.whitedove.common.utils.CookieUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/24 15:20
 */
@Controller
public class LoginController {

    //登出
    @RequestMapping("/logout")
    public void loginUI(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CookieUtils.setCookie(request, response, "W_TOKEN", null);
        response.sendRedirect("http://localhost:8083/login");
    }
}
