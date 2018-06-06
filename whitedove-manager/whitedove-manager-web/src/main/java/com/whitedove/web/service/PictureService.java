package com.whitedove.web.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author scq
 * @version 创建时间：2018年3月22日 上午8:56:56
 * 类说明
 */
public interface PictureService {
    Map uploadPicture(MultipartFile uploadFile);
}
