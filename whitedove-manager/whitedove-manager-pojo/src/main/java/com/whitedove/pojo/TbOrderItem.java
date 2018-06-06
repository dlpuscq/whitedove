package com.whitedove.pojo;

import lombok.Data;

@Data
public class TbOrderItem {

    private Long orderItemId;

    private Long orderId;

    private Long itemId;

    private String itemPic;

    private String itemName;

    private Long price;


}