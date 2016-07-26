package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;

public interface ProfitService {
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no);
}
