package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderService {
	public List<Order_InformationDTO> getOrder_Information(int member_no, int store_no, int start_Page, boolean asce, String search_order_info);
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto, MaterialOrderDTO orderDto);
}
