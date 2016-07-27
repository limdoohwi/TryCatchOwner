package com.trycatch.owner.service;


import org.json.simple.JSONObject;


public interface ProfitService {
	public JSONObject getMonthProfit(int store_no, int member_no);
	public JSONObject getYearProfit(int store_no, int member_no);
}
