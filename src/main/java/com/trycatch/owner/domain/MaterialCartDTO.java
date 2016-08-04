/*
 * 	Class: MaterialCartDTO
 *  Description: MaterialCart table에 관련된 값을 가지는 DTO
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.domain;

public class MaterialCartDTO {
	private int material_cart_no;	
	private int member_no;
	private int material_no;
	private int material_price;
	private int material_count;
	private String material_name;
	
	public int getMaterial_price() {
		return material_price;
	}
	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	public int getMaterial_cart_no() {
		return material_cart_no;
	}
	public void setMaterial_cart_no(int material_cart_no) {
		this.material_cart_no = material_cart_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMaterial_no() {
		return material_no;
	}
	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}
	public int getMaterial_count() {
		return material_count;
	}
	public void setMaterial_count(int material_count) {
		this.material_count = material_count;
	}
}