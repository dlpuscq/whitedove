package com.whitedove.sso.service;

import com.whitedove.common.utils.WhiteDoveResult;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/29 14:49
 */
public interface PasswordService {
    WhiteDoveResult checkPwd(String email);
}
