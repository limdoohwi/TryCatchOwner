/*
 * 	Class: MaterialPaymentDetailDTO
 *  Description: MaterialPayment 자세한 table에 관련된 값을 가지는 DTO
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.domain;

public class MaterialPaymentDetailDTO {
	private int material_price;
	private int material_total_price;
	private int material_count;
	private String material_name;

	public int getMaterial_price() {
		return material_price;
	}

	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}

	public int getMaterial_total_price() {
		return material_total_price;
	}

	public void setMaterial_total_price(int material_total_price) {
		this.material_total_price = material_total_price;
	}

	public int getMaterial_count() {
		return material_count;
	}

	public void setMaterial_count(int material_count) {
		this.material_count = material_count;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

}
