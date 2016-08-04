/*
 * 	Interface: MaterialService
 *  Description: Controller와 MaterialDAO와의 연결을 담당하는 Service 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MaterialDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;

public interface MaterialService {
	public List<MaterialDTO> showmaterial_coffee();
	public List<MaterialDTO> showmaterial_cake();
	public List<MaterialPaymentDTO> insert_materialpayment(int store_no, int member_no);
	public List<MaterialCartDTO> showmaterialConfirm(int member_no);
	public JSONObject getMaterialPaymentList(int store_no, String date, int start_page);
	public JSONObject getMaterialPaymentDetailList(int material_payment_no) throws Exception;
}
