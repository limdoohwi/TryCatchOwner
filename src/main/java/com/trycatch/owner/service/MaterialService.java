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
