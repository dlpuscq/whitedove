package com.whitedove.portal.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * @author scq
 * @version 创建时间：2018年3月22日 上午8:56:56
 * 类说明
 */
public interface PictureService {
    Map uploadPicture(MultipartFile uploadFile);
}
