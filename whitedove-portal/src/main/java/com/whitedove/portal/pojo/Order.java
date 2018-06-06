package com.whitedove.portal.pojo;

import com.whitedove.pojo.TbOrderItem;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/30 11:09
 */
@Data
public class Order{

    private Long orderId;

    private Long userId;

    private String username;

    private Integer num;

    private Long totalFee;

    private Date created;

    private Date updated;

    private String status;

    private List<TbOrderItem> orderItems;

}
