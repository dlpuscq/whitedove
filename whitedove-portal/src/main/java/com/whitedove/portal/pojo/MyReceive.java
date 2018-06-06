package com.whitedove.portal.pojo;

import com.whitedove.pojo.TbCollection;
import lombok.Data;


/**
 * @description
 * @autoor Songcq
 * @date 2018/5/30 13:59
 */
@Data
public class MyReceive {

    private Long id;

    private Long userId;

    private Long itemId;

    private String itemName;

    private String itemPic;

    private String itemTitle;
}
