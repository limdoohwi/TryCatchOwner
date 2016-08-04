/*
 * 	Class: ProfitServiceImpl
 *  Description: ProfitDAOImpl에서 받아온 Data를 가공하기 위한 Service
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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.trycatch.owner.domain.MenuProfitDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.domain.ProfitYearDTO;
import com.trycatch.owner.persistence.MenuDAO;
import com.trycatch.owner.persistence.ProfitDAO;

@Service
public class ProfitServiceImpl implements ProfitService {
	@Inject
	private ProfitDAO dao;
	@Inject
	private MenuDAO menuDao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfitServiceImpl.class);
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 월별 매출액 호출(Main.jsp)
	 */
	@Override
	public JSONObject getMonthProfit(int store_no, int member_no) {
		JSONObject jsonRoot = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonTemp = null;
		JSONObject jsonMenuCategory = new JSONObject();
		List<String> menuCategoryList = menuDao.getMenuCategoryList();
		String[] categoryName = new String[menuCategoryList.size()];
		for(int i=0; i<menuCategoryList.size(); i++){
			categoryName[i] = menuCategoryList.get(i);
		}
		
		for(int month=0; month<12; month++){
			List<ProfitMonthDTO> profitList = dao.getMonthProfit(store_no, member_no, month+1);
			jsonTemp = new JSONObject();
			jsonTemp.put("month", month+1);
			int[] categoryPrice = new int[menuCategoryList.size()];
			String menuAndPrice = "";
			for(int j=0; j<menuCategoryList.size(); j++){
				for(int i=0; i<profitList.size(); i++){
					if(categoryName[j].equals(profitList.get(i).getMenu_category_name()))
						categoryPrice[j] = profitList.get(i).getTotal_price();
				}
			}
			for(int i=0; i<menuCategoryList.size(); i++){
				menuAndPrice += categoryName[i] + "," + String.valueOf(categoryPrice[i]) + "/";
			}
			jsonTemp.put("profitMenu", menuAndPrice);
			jsonArray.add(jsonTemp);
		}
		jsonRoot.put("categoryList", menuCategoryList);
		jsonRoot.put("profitMonthList", jsonArray);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 이번 연도 매출액 호출(Main.jsp)
	 */
	@Override
	public JSONObject getYearProfit(int store_no, int member_no) {
		JSONObject jsonRoot = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonTemp = null;
		JSONObject jsonMenuCategory = new JSONObject();
		List<String> menuCategoryList = menuDao.getMenuCategoryList();
		String[] categoryName = new String[menuCategoryList.size()];
		for(int i=0; i<menuCategoryList.size(); i++){
			categoryName[i] = menuCategoryList.get(i);
		}
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sd.format(date));
		for(int startYear=year-2; startYear<=year; startYear++){
			List<ProfitYearDTO> yearList = dao.getYearProfit(store_no, member_no, startYear);
			jsonTemp = new JSONObject();
			jsonTemp.put("year", startYear);
			int[] categoryPrice = new int[menuCategoryList.size()];
			String menuAndPrice = "";
			for(int j=0; j<menuCategoryList.size(); j++){
				for(int i=0; i<yearList.size(); i++){
					if(categoryName[j].equals(yearList.get(i).getMenu_category_name()))
						categoryPrice[j] = yearList.get(i).getTotal_price();
				}
			}
			for(int i=0; i<menuCategoryList.size(); i++){
				menuAndPrice += categoryName[i] + "," + String.valueOf(categoryPrice[i]) + "/";
			}
			jsonTemp.put("profitMenu", menuAndPrice);
			jsonArray.add(jsonTemp);
		}
		jsonRoot.put("categoryList", menuCategoryList);
		jsonRoot.put("profitYearList", jsonArray);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도 총 매출액 호출
	 */
	@Override
	public JSONObject getYearTotalPrice(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		int total_price = dao.getYearTotalPrice(store_no, year);
		jsonRoot.put("year_total_price", total_price);
		return jsonRoot;
	}

	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도를 기준으로 2년전 연도별 매출과 입력된 연도 매출액 호출
	 */
	@Override
	public JSONObject getYearsTotalPrice(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		List<Integer> list = new ArrayList<>();
		for(int i=year-2; i<year+1; i++){
			list.add(dao.getYearsTotalPrice(store_no, i));
		}
		jsonRoot.put("yearPriceList", list);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 월별 총 매출액 호출
	 */
	@Override
	public JSONObject getMonthTotalPrice(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		List<ProfitMonthDTO> list = new ArrayList<>();
		for(int month=0; month<12; month++){
			ProfitMonthDTO dto = dao.getMonthTotalPrice(store_no, month+1, year);
			if(dto == null){
				dto = new ProfitMonthDTO();
				dto.setMonth(month+1);
				dto.setTotal_price(0);
			}
			list.add(dto);
		}
		jsonRoot.put("monthPriceList", list);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 음료 주문 건수 호출
	 */
	@Override
	public JSONObject getYearReservationDrink(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("yearReservationDrinkCount", dao.getYearReservationDrink(store_no, year));
		return jsonRoot;
	}

	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 월별 음료 주문 건수 호출
	 */
	@Override
	public JSONObject getMonthReservationDrink(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		List<Integer> list = new ArrayList<>();
		for(int month=0; month<12; month++){
			int monthReservationCount = dao.getMonthReservationDrink(store_no, month+1, year);
			list.add(monthReservationCount);
		}
		jsonRoot.put("monthReservationCount", list);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 일일 평균 음료 주문 건수 호출
	 */
	@Override
	public JSONObject getDayAverageReservationDrink(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		List<Double> list = new ArrayList<>();
		String thisYear = String.valueOf(year) + "-01-01";
		int nowDaysFrom01_01 = dao.getDayto_Curdate_withThisYear(thisYear);
		for(int hour = 10; hour<23; hour++){
			if(nowDaysFrom01_01 == 0){
				list.add(0.0);
			}
			else{
				int hourReservationCount = dao.getDayAverageReservationDrink(store_no, hour, year);
				double dayHourAverageCount = Math.ceil((double)(hourReservationCount)/nowDaysFrom01_01);
				list.add(dayHourAverageCount);
			}
		}
		jsonRoot.put("dayHourReservationCount", list);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 카테고리 별 판매율 호출
	 */
	@Override
	public JSONObject getYearMenuPercentager(int store_no, int year, int month) {
		JSONObject jsonRoot = new JSONObject();
		JSONObject jsonTemp = null;
		JSONArray jsonArray = new JSONArray();
		List<String> list = menuDao.getMenuCategoryList();
		for(int i=0; i<list.size(); i++){
			int menuProfit = dao.getYearMenuPercentager(store_no, list.get(i), year, month);
			jsonTemp = new JSONObject();
			jsonTemp.put("category_name", list.get(i));
			jsonTemp.put("percentage", menuProfit);
			jsonArray.add(jsonTemp);
		}
		jsonRoot.put("yearMenuPercentage", jsonArray);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 월별 카테고리 별 판매율 호출
	 */
	@Override
	public JSONObject getMonthMenuPercentager(int store_no, int month) {
		JSONObject jsonRoot = new JSONObject();
		JSONObject jsonTemp = null;
		JSONArray jsonArray = new JSONArray();
		List<String> list = menuDao.getMenuCategoryList();
		for(int i=0; i<list.size(); i++){
			int menuMonthProfit = dao.getMonthMenuPercentager(store_no, list.get(i), month);
			jsonTemp = new JSONObject();
			jsonTemp.put("category_name", list.get(i));
			jsonTemp.put("percentage", menuMonthProfit);
			jsonArray.add(jsonTemp);
		}
		jsonRoot.put("monthMenuPercentage", jsonArray);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 매출액이 있는지 검사
	 */
	@Override
	public JSONObject isExist(int store_no, int year) {
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("isExist", dao.isExistProfit(store_no, year));
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 등록된 매장의 입력된 연도의 메뉴별 판매 개수와 판매액 호출
	 */
	@Override
	public JSONObject getMenuCountAndPrice(int store_no, int year, int month) {
		JSONObject jsonRoot = new JSONObject();
		JSONObject jsonTemp = null;
		JSONObject jsonFirstTemp = null;
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonFirstArray = new JSONArray();
		List<String> list = menuDao.getMenuCategoryList();
		for(int i=0; i<list.size(); i++){
			List<String> menuList = menuDao.getMenuName_withCategory_Name(list.get(i));
			jsonFirstTemp = new JSONObject();
			jsonArray = new JSONArray();
			for(int j=0; j<menuList.size(); j++){
				jsonTemp = new JSONObject();
				jsonTemp.put("menu_name", menuList.get(j));
				MenuProfitDTO menuProfitDto = dao.getMenuCountAndPrice(store_no, year, menuList.get(j), month);
				jsonTemp.put("menu_count", menuProfitDto.getMenu_count());
				jsonTemp.put("menu_total_price", menuProfitDto.getMenu_total_price());
				jsonArray.add(jsonTemp);
			}
			jsonFirstTemp.put("menu_List", jsonArray);
			jsonFirstTemp.put("categroy_name", list.get(i));
			jsonFirstArray.add(jsonFirstTemp);
		}
		jsonRoot.put("menuCountAndPrice", jsonFirstArray);
		return jsonRoot;
	}
}
