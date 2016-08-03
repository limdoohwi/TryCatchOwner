package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.MaterialPaymentDetailDTO;
import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderDAO {
	public List<Order_InformationDTO> getOrder_Information(int menu_payment_no, int member_no, int store_no, int start_Page, boolean asce, String search_order_info);
	public List<Integer> getMenu_Payment_noList(int store_no);
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto);
	public boolean insertMaterial_Order(MaterialOrderDTO dto);
	public List<MaterialPaymentDTO> getMaterialPaymentList(int store_no, String date, int start_page);
	public List<MaterialPaymentDetailDTO> getMaterialPaymentDetailList(int material_payment_no);
}
