package com.whitedove.portal.pojo;

import lombok.Data;

/**  
 *
 * @author songcq
 * @description
 * @date 2018/4/18 20:00
 * @param   
 * @return   
 */ 
@Data
public class CartItem {

	private String id;
	private String title;
	private Integer num;
	private long price;
	private String image;
	private Long userid;
	private String username;
	
}
