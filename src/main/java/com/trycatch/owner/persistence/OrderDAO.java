package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderDAO {
	public List<Order_InformationDTO> getOrder_Information(int member_no);
}
