/*
 * 	Class: ProfitService
 *  Description: ProfitDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­30
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-30 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 김준혁
 *  2. What		  : getDayAverageReservationDrink(), getYearMenuPercentager(),
 *  				getMonthMenuPercentager(),	isExist(),
 *  				getMenuCountAndPrice() 추가
 */

package com.trycatch.owner.service;


import org.json.simple.JSONObject;


public interface ProfitService {
	public JSONObject getMonthProfit(int store_no, int member_no);
	public JSONObject getYearProfit(int store_no, int member_no);
	public JSONObject getYearTotalPrice(int store_no, int year);
	public JSONObject getYearsTotalPrice(int store_no, int year);
	public JSONObject getMonthTotalPrice(int store_no, int year);
	public JSONObject getYearReservationDrink(int store_no, int year);
	public JSONObject getMonthReservationDrink(int store_no, int year);
	public JSONObject getDayAverageReservationDrink(int store_no, int year);
	public JSONObject getYearMenuPercentager(int store_no, int year, int month);
	public JSONObject getMonthMenuPercentager(int store_no, int month);
	public JSONObject isExist(int store_no, int year);
	public JSONObject getMenuCountAndPrice(int store_no, int year, int month);
}
