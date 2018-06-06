package com.whitedove.portal.service.impl;

import com.whitedove.common.utils.HttpClientUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbUser;
import com.whitedove.portal.service.UserService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/24 14:32
 */
@Service
public class UserServiceImpl implements UserService {

    @Value("${SSO_BASE_URL}")
    public String SSO_BASE_URL;
    @Value("${SSO_USER_TOKEN}")
    private String SSO_USER_TOKEN;
    @Value("${SSO_PAGE_LOGIN}")
    public String SSO_PAGE_LOGIN;

    @Override
    public TbUser getUserByToken(String token) {
        try {
            //调用sso系统的服务，根据token取用户信息
            String json = HttpClientUtil.doGet(SSO_BASE_URL + SSO_USER_TOKEN + token);
            //把json转换成TaotaoREsult
            WhiteDoveResult result = WhiteDoveResult.formatToPojo(json, TbUser.class);
            if (result != null){
                if (result.getStatus() == 200) {
                    TbUser user = (TbUser) result.getData();
                    return user;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
