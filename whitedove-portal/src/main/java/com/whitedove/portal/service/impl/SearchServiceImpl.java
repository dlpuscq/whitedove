package com.whitedove.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.whitedove.common.utils.HttpClientUtil;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.portal.pojo.SearchResult;
import com.whitedove.portal.service.SearchService;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * 搜索Service
 */

@Service
public class SearchServiceImpl implements SearchService {

	@Value("${SEARCH_BASE_URL}")
	private String SEARCH_BASE_URL;
	
	@Override
	public SearchResult search(String queryString, int page) {
		// 调用whitedove-search的服务
		//查询参数
		Map<String, String> param = new HashMap<>();
		param.put("q", queryString);
		param.put("page", page + "");
		try {
			//调用服务
			String json = HttpClientUtil.doGet(SEARCH_BASE_URL, param);
			//把字符串转换成java对象
            WhiteDoveResult whiteDoveResult = WhiteDoveResult.formatToPojo(json, SearchResult.class);
			if (whiteDoveResult.getStatus() == 200) {
				SearchResult result = (SearchResult) whiteDoveResult.getData();
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
