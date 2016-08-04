package com.trycatch.owner.domain;

public class Order_AlarmDTO {
	private int order_alarm_no;
    private int order_category_no;
    private String order_content;
    private String order_regdate;
    private int store_no;
    private String store_name;
    
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getOrder_alarm_no() {
		return order_alarm_no;
	}
	public void setOrder_alarm_no(int order_alarm_no) {
		this.order_alarm_no = order_alarm_no;
	}
	public int getOrder_category_no() {
		return order_category_no;
	}
	public void setOrder_category_no(int order_category_no) {
		this.order_category_no = order_category_no;
	}
	public String getOrder_content() {
		return order_content;
	}
	public void setOrder_content(String order_content) {
		this.order_content = order_content;
	}
	public String getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
    
}
