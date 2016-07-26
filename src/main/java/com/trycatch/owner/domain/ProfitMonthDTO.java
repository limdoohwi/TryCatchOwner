package com.trycatch.owner.domain;

import java.util.Map;

public class ProfitMonthDTO {
	private int month;
	private String menu_category_name;
	private int total_price;
	private Map profitMap;
	public int getMonth() {
		return month;
	}
	public String getMenu_category_name() {
		return menu_category_name;
	}
	public int getTotal_price() {
		return total_price;
	}
	public Map getProfitMap() {
		return profitMap;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public void setProfitMap(Map profitMap) {
		this.profitMap = profitMap;
	}
	
	
}
