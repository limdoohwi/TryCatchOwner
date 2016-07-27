package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;

public interface ProfitDAO {
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no, int month);
}
