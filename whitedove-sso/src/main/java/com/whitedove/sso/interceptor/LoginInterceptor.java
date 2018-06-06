package com.whitedove.sso.interceptor;

import com.whitedove.common.utils.CookieUtils;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.sso.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/24 14:29
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        //在Handler执行之前处理
        //判断用户是否登录
        //从cookie中取token
        String token = CookieUtils.getCookieValue(request, "W_TOKEN");
        //根据token换取用户信息，调用sso系统的接口。
        WhiteDoveResult result = userService.getUserByToken(token);
        //取不到用户信息
        if ( result.getStatus()==200) {
            //跳转到登录页面，把用户请求的url作为参数传递给登录页面。
            response.sendRedirect("http://localhost:8081");
            //返回false
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // handler执行之后，返回ModelAndView之前

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 返回ModelAndView之后。
        //响应用户之后。

    }

}