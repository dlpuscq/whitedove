package com.whitedove.portal.controller;

import com.whitedove.common.utils.JsonUtils;
import com.whitedove.portal.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Map;


/**
 * @author Scq
 * @version 创建时间：2018年5月30日 下午5:23:30
 * 类说明 图片上传
 */
@Controller
public class PictureController {

	@Autowired
	private PictureService pictureService;

	@RequestMapping("/headpic/upload")
	@ResponseBody
	public String pictureUpload(MultipartFile picfile, HttpServletResponse response) throws UnsupportedEncodingException {
		Map result = pictureService.uploadPicture(picfile);
		// 为了保证功能的兼容性，需要把Result转换成json格式的字符串。
        response.setContentType("text/html;charset=utf-8");
		String json = JsonUtils.objectToJson(result);
		return json;
	}
}
