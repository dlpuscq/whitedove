package com.whitedove.pojo;

public class TbItemMsg {
    private Long itemId;

    private String itemCollection;

    private Long sales;

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemCollection() {
        return itemCollection;
    }

    public void setItemCollection(String itemCollection) {
        this.itemCollection = itemCollection == null ? null : itemCollection.trim();
    }

    public Long getSales() {
        return sales;
    }

    public void setSales(Long sales) {
        this.sales = sales;
    }
}