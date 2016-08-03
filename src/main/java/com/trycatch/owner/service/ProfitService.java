package com.trycatch.owner.service;


import java.util.List;

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
