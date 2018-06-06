package com.whitedove.common.pojo;
/**
 * @author Scq
 * @version 创建时间：2018年3月21日 上午10:46:47
 * 类说明 EasyUI 树实体类
 */
public class EUTreeNode {
	private long id;
	private String text;
	private String state;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
