package com.trycatch.owner.domain;

import java.util.Map;

public class ProfitYearDTO {
	private int year;
	private String menu_category_name;
	private int total_price;

	public int getYear() {
		return year;
	}

	public String getMenu_category_name() {
		return menu_category_name;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

}
