package com.wihtedove.portal.solr;

import com.whitedove.common.utils.HttpClientUtil;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;

public class TestSolrJ {

    @Test
    public void addDocument() throws Exception {
        //创建一连接
        SolrServer solrServer = new HttpSolrServer("http://192.168.1.3:9999/solr");
        //创建一个文档对象
        SolrInputDocument document = new SolrInputDocument();
        document.addField("id", "test002");
        document.addField("item_title", "测试学科1");
        document.addField("item_price", 54321);
        //把文档对象写入索引库
        solrServer.add(document);
        //提交
        solrServer.commit();
    }

    @Test
    public void deleteDocument() throws Exception {
        //创建一连接
        SolrServer solrServer = new HttpSolrServer("http://192.168.1.3:9999/solr");
        solrServer.deleteById("*");
        solrServer.deleteByQuery("*:*");
        solrServer.commit();
    }

    @Test
    public void queryDocument() throws Exception {
        SolrServer solrServer = new HttpSolrServer("http://192.168.1.3:9999/solr");
        //创建一个查询对象
        SolrQuery query = new SolrQuery();
        //设置查询条件
        query.setQuery("*:*");
        query.setStart(20);
        query.setRows(50);
        //执行查询
        QueryResponse response = solrServer.query(query);
        //取查询结果
        SolrDocumentList solrDocumentList = response.getResults();
        System.out.println("共查询到记录：" + solrDocumentList.getNumFound());
        for (SolrDocument solrDocument : solrDocumentList) {
            System.out.println(solrDocument.get("id"));
            System.out.println(solrDocument.get("item_title"));
            System.out.println(solrDocument.get("item_price"));
            System.out.println(solrDocument.get("item_image"));
        }
    }

    @Test
    public void importAll(){
        HttpClientUtil.doGet("http://localhost:8082/search/manager/importall");
    }
}
