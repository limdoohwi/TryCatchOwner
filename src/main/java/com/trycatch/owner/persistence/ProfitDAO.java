package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.domain.ProfitYearDTO;

public interface ProfitDAO {
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no, int month);
	public List<ProfitYearDTO> getYearProfit(int store_no, int member_no, int year);
}
