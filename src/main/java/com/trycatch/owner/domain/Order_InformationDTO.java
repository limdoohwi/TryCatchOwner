package com.trycatch.owner.domain;

public class Order_InformationDTO {
	private String order_name;
	private String order_tel;
	private String menu_reserve_time;
	private int menu_total_price;
	private String[] menu_no;
	private String[] menu_count;
	private String[] menu_option;
	private String menu_simple_list;
	private String menu_total_list = "";
	private int store_no;
	private String store_name;

	public String getMenu_simple_list() {
		return menu_simple_list;
	}

	public void setMenu_simple_list(String menu_simple_list) {
		this.menu_simple_list = menu_simple_list;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getMenu_total_list() {
		return menu_total_list;
	}

	public void setMenu_total_list(String[] menu_name, String[] menu_count, String[] menu_option) {
		for (int i = 0; i < menu_name.length; i++) {
			this.menu_total_list += menu_name[i] + "/" + menu_count[i] + "ÀÜ/" + menu_option[i] + ", ";
		}
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public String getMenu_reserve_time() {
		return menu_reserve_time;
	}

	public void setMenu_reserve_time(String menu_reserve_time) {
		this.menu_reserve_time = menu_reserve_time;
	}

	public int getMenu_total_price() {
		return menu_total_price;
	}

	public void setMenu_total_price(int menu_total_price) {
		this.menu_total_price = menu_total_price;
	}

	public String[] getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no.split(",");
	}

	public String[] getMenu_count() {
		return menu_count;
	}

	public void setMenu_count(String menu_count) {
		this.menu_count = menu_count.split(",");
	}

	public String[] getMenu_option() {
		return menu_option;
	}

	public void setMenu_option(String menu_option) {
		this.menu_option = menu_option.split(",");
	}

}
