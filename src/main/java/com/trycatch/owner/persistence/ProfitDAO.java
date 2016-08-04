/*
 * 	Class: ProfitDAO
 *  Description: Menu_Payment, Menu_Order Table를 join하여  DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­30
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-30 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 김준혁
 *  2. What		  : getDayAverageReservationDrink(), getYearMenuPercentager(),
 *  				getMonthMenuPercentager(),	isExistProfit(),
 *  				getMenuCountAndPrice() 추가
 */

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
	public int getYearMenuPercentager(int store_no, String category_name, int year, int month);
	public int getMonthMenuPercentager(int store_no, String category_name, int month);
	public boolean isExistProfit(int store_no, int year);
	public MenuProfitDTO getMenuCountAndPrice(int store_no, int year, String menu_name, int month);
}
