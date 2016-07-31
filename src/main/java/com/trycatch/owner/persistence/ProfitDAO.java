package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MenuProfitDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.domain.ProfitYearDTO;

public interface ProfitDAO {
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no, int month);
	public ProfitMonthDTO getMonthTotalPrice(int store_no, int month, int year);
	public List<ProfitYearDTO> getYearProfit(int store_no, int member_no, int year);
	public int getYearTotalPrice(int store_no, int year);
	public int getYearsTotalPrice(int store_no, int year);
	public int getYearReservationDrink(int store_no, int year);
	public int getMonthReservationDrink(int store_no, int month, int year);
	public int getDayAverageReservationDrink(int store_no, int hour, int year);
	public int getDayto_Curdate_withThisYear(String thisYear);
	public int getYearMenuPercentager(int store_no, String category_name, int year);
	public int getMonthMenuPercentager(int store_no, String category_name, int month);
	public boolean isExistProfit(int store_no, int year);
	public MenuProfitDTO getMenuCountAndPrice(int store_no, int year, String menu_name, int month);
}
