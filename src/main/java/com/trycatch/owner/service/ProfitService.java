package com.trycatch.owner.service;


import org.json.simple.JSONObject;


public interface ProfitService {
	public JSONObject getMonthProfit(int store_no, int member_no);
	public JSONObject getYearProfit(int store_no, int member_no);
	public JSONObject getYearTotalPrice(int store_no, int year);
	public JSONObject getYearsTotalPrice(int store_no);
	public JSONObject getMonthTotalPrice(int store_no);
	public JSONObject getYearReservationDrink(int store_no);
	public JSONObject getMonthReservationDrink(int store_no);
	public JSONObject getDayAverageReservationDrink(int store_no);
	public JSONObject getYearMenuPercentager(int store_no, int year, String yearProfit);
}
