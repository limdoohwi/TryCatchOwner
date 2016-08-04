/*
 * 	Class: MaterialOrderDTO
 *  Description: MaterialOrder table에 관련된 값을 가지는 DTO
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.domain;

public class MaterialOrderDTO {
	private int material_payment_no;
	private int material_oreder_no;
	private int[] material_nos;
	private int[] material_counts;
	private int material_no;
	private int material_count;

	public int getMaterial_payment_no() {
		return material_payment_no;
	}

	public void setMaterial_payment_no(int material_payment_no) {
		this.material_payment_no = material_payment_no;
	}

	public int getMaterial_oreder_no() {
		return material_oreder_no;
	}

	public void setMaterial_oreder_no(int material_oreder_no) {
		this.material_oreder_no = material_oreder_no;
	}

	public int[] getMaterial_nos() {
		return material_nos;
	}

	public void setMaterial_nos(int[] material_nos) {
		this.material_nos = material_nos;
	}

	public int[] getMaterial_counts() {
		return material_counts;
	}

	public void setMaterial_counts(int[] material_counts) {
		this.material_counts = material_counts;
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
