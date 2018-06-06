package com.whitedove.portal.pojo;

import lombok.Data;

@Data
public class Item {

	private String id;
	private String title;
	private String sellPoint;
	private long price;
	private String image;
	private Long cid;
	private Long sales;
	private String categoryName;
	private String itemCollection;
	private String[] images;
    private String itemDesc;

	public String[] getImages() {
		if (image != null) {
			String[] images = image.split(",");
			return images;
		}
		return null;
	}
	
}
