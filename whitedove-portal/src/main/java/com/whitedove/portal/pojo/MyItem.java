package com.whitedove.portal.pojo;

import lombok.Data;

@Data
public class MyItem {

    private Long id;

    private Long userId;

    private Long itemId;

    private String itemName;

    private String itemPic;

    private String itemTitle;


}