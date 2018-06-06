package com.whitedove.search.dao;

import com.whitedove.search.pojo.SearchResult;
import org.apache.solr.client.solrj.SolrQuery;



public interface SearchDao {

	SearchResult search(SolrQuery query) throws Exception;
}
