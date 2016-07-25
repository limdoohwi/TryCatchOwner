package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderService {
	public List<Order_InformationDTO> getOrder_Information(int member_no);
}
