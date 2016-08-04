/*
 * 	Class: MaterialDTO
 *  Description: Material table에 관련된 값을 가지는 DTO
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.domain;

public class MaterialDTO {
	private int material_no;
	private String material_name;
	private int material_price;
	private int material_category_no;

	 
	public int getMaterial_no() {
		return material_no;
	}
	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	public int getMaterial_price() {
		return material_price;
	}
	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}
	public int getMaterial_category_no() {
		return material_category_no;
	}
	public void setMaterial_category_no(int material_category_no) {
		this.material_category_no = material_category_no;
	}

	
}
