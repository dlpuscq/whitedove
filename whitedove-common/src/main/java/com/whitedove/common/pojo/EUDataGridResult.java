package com.whitedove.common.pojo;

import java.util.List;

/**
 * @author 作者
 * @version 创建时间：2018年3月21日 上午10:06:57
 * 类说明
 */
public class EUDataGridResult {
	
	private long total;
	private List<?> rows;
	
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	
	
}
