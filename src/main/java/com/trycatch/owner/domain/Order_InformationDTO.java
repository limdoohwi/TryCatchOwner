/*
 * 	Class: Order_InformationDTO
 *  Description: Menu_Payment, Menu_Order Table의 join된 레코드를 저장하기 위한 DTO
 *  Created: 2016­07­30
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-30 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.domain;

public class Order_InformationDTO {
	private int menu_payment_no;
	private String order_name;
	private String order_tel;
	private String menu_reserve_time;
	private int menu_total_price;
	private String menu_name;
	private String menu_count;
	private String menu_option;
	private String menu_simple_list;
	private String menu_total_list = "";
	private String menu_payment_date;
	private int store_no;
	private String store_name;

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_payment_no() {
		return menu_payment_no;
	}

	public String getOrder_name() {
		return order_name;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public String getMenu_reserve_time() {
		return menu_reserve_time;
	}

	public int getMenu_total_price() {
		return menu_total_price;
	}

	public String getMenu_count() {
		return menu_count;
	}

	public String getMenu_option() {
		return menu_option;
	}

	public String getMenu_simple_list() {
		return menu_simple_list;
	}

	public String getMenu_total_list() {
		return menu_total_list;
	}

	public String getMenu_payment_date() {
		return menu_payment_date;
	}

	public int getStore_no() {
		return store_no;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setMenu_payment_no(int menu_payment_no) {
		this.menu_payment_no = menu_payment_no;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public void setMenu_reserve_time(String menu_reserve_time) {
		this.menu_reserve_time = menu_reserve_time;
	}

	public void setMenu_total_price(int menu_total_price) {
		this.menu_total_price = menu_total_price;
	}

	public void setMenu_count(String menu_count) {
		this.menu_count = menu_count;
	}

	public void setMenu_option(String menu_option) {
		this.menu_option = menu_option;
	}

	public void setMenu_simple_list(String menu_simple_list) {
		this.menu_simple_list = menu_simple_list;
	}

	public void setMenu_total_list(String menu_total_list) {
		this.menu_total_list = menu_total_list;
	}

	public void setMenu_payment_date(String menu_payment_date) {
		this.menu_payment_date = menu_payment_date;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

}
