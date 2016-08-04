/*
 * 	Class: MaterialPaymentDTO
 *  Description: MaterialPayment table에 관련된 값을 가지는 DTO
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.domain;

public class MaterialPaymentDTO {
	private int material_payment_no;
	private int material_total_price;
	private String material_payment_date;
	private String material_oreder_date;
	private int member_no;
	private int store_no;
	private String member_name;
	private String store_name;

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getMaterial_payment_no() {
		return material_payment_no;
	}

	public void setMaterial_payment_no(int material_payment_no) {
		this.material_payment_no = material_payment_no;
	}

	public int getMaterial_total_price() {
		return material_total_price;
	}

	public void setMaterial_total_price(int material_total_price) {
		this.material_total_price = material_total_price;
	}

	public String getMaterial_payment_date() {
		return material_payment_date;
	}

	public void setMaterial_payment_date(String material_payment_date) {
		this.material_payment_date = material_payment_date;
	}

	public String getMaterial_oreder_date() {
		return material_oreder_date;
	}

	public void setMaterial_oreder_date(String material_oreder_date) {
		this.material_oreder_date = material_oreder_date;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

}
