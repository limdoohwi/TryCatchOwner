package com.trycatch.owner.domain;

public class MenuProfitDTO {
	private int menu_count;
	private int menu_total_price;

	public int getMenu_count() {
		return menu_count;
	}

	public int getMenu_total_price() {
		return menu_total_price;
	}

	public void setMenu_count(int menu_count) {
		this.menu_count = menu_count;
	}

	public void setMenu_total_price(int menu_total_price) {
		this.menu_total_price = menu_total_price;
	}
}
