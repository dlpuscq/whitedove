package com.whitedove.web.controller;

import java.util.Map;


import com.whitedove.web.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.whitedove.common.utils.JsonUtils;


/**
 * @author Scq
 * @version 创建时间：2018年3月25日 下午5:23:30
 * 类说明 图片上传
 */
@Controller
public class PictureController {

	@Autowired
	private PictureService pictureService;

	@RequestMapping("/pic/upload")
	@ResponseBody
	public String pictureUpload(MultipartFile uploadFile) {
		Map result = pictureService.uploadPicture(uploadFile);
		// 为了保证功能的兼容性，需要把Result转换成json格式的字符串。
		String json = JsonUtils.objectToJson(result);
		return json;
	}
}
