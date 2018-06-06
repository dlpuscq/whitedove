package com.whitedove.portal.service;


import com.whitedove.portal.pojo.SearchResult;

public interface SearchService {

	SearchResult search(String queryString, int page);
}
