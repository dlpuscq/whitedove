package com.whitedove.search.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class Item {

	private String id;
	private String title;
	private String sellPoint;
	private long price;
	private String image;
	private Long cid;
	private String categoryName;
	private String[] images;
	private String itemDesc;

	@JsonIgnore
	public String[] getImages() {
		if (image != null) {
			String[] images = image.split(",");
			return images;
		}
		return null;
	}
	
	
}
