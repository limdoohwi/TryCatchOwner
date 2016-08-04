/*
 * 	Class: ProfitController
 *  Description: tryowner 웹서비스에서 설정된 매장의 매출액을 호출하는 Controller
 *  Created: 2016­07­30
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-30 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 김준혁
 *  2. What		  : dayReservationDrinkOwnerPOST(), yearMenuPercentageOwnerPOST(),
 *  				monthMenuPercentageOwnerPOST(),	isExistProfitOwnerPOST(),
 *  				menuCountAndPriceProfitOwnerPOST() 추가
 */

package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.MeetingRoomService;
import com.trycatch.owner.service.MenuService;
import com.trycatch.owner.service.ProfitService;

@Controller
public class ProfitController {
	@Inject
	private ProfitService service;
	@Inject
	private MenuService menuService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfitController.class);
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 메인 화면에서 현재 설정된 매장의 현재 연도를 기준으로 한 월별 매출액을 호출
	 */
	@RequestMapping("/month_profit/main/chart")
	public @ResponseBody Object monthProfitInMainPOST(HttpServletRequest req) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthProfit(storeDto.getStore_no(), memberDto.getMember_no());
		jsonRoot.put("categoryList", menuService.getMenuCategoryList());
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 메인 화면에서 현재 설정된 매장의 현재 연도를 기준으로 2년전 부터 현재 연도까지 총 3개 연도 매출액 호출
	 */
	@RequestMapping("/year_profit/main/chart")
	public @ResponseBody Object yearProfitInMainPOST(HttpServletRequest req) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearProfit(storeDto.getStore_no(), memberDto.getMember_no());
		jsonRoot.put("categoryList", menuService.getMenuCategoryList());
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의 클라이언트가 입력한 해당 연도 총 매출액을 호출
	 */
	@RequestMapping("/year_profit/profit_owner")
	public @ResponseBody Object yearProfitOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		return service.getYearTotalPrice(storeDto.getStore_no(), year);
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서   현재 설정된 매장의 클라이언트가 입력한 해당 연도를 기준으로 2년전 부터 현재 연도가지 총 3개 연도의 총 매출액 호출
	 */
	@RequestMapping("/years_profit/profit_owner")
	public @ResponseBody Object yearsProfitOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		return service.getYearsTotalPrice(storeDto.getStore_no(), year);
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 월별 총 매출액 호출
	 */
	@RequestMapping("/month_profit/profit_owner")
	public @ResponseBody Object monthProfitOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthTotalPrice(storeDto.getStore_no(), year);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 총 음료 예약 건수를 호출
	 */
	@RequestMapping("/year_reservation_drink/profit_owner")
	public @ResponseBody Object yearReservationDrinkOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearReservationDrink(storeDto.getStore_no(), year);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 월별 총 음료 예약 건수를 호출
	 */
	@RequestMapping("/month_reservation_drink/profit_owner")
	public @ResponseBody Object monthReservationDrinkOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthReservationDrink(storeDto.getStore_no(), year);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 일별 평균 예약 건수를 호출
	 */
	@RequestMapping("/day_reservation_drink/profit_owner")
	public @ResponseBody Object dayReservationDrinkOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getDayAverageReservationDrink(storeDto.getStore_no(), year);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 카테고리 별 판매율 호출
	 */
	@RequestMapping("/year_menu_percentage/profit_owner")
	public @ResponseBody Object yearMenuPercentageOwnerPOST(HttpServletRequest req, int year, int month) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearMenuPercentager(storeDto.getStore_no(), year, month);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 월별 카테고리 별 판매율 호출
	 */
	@RequestMapping("/month_menu_percentage/profit_owner")
	public @ResponseBody Object monthMenuPercentageOwnerPOST(HttpServletRequest req, int month) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthMenuPercentager(storeDto.getStore_no(), month);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 매출액 Data가 있는지 검사
	 */
	@RequestMapping("/isExistProfit/profit_owner")
	public @ResponseBody Object isExistProfitOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.isExist(storeDto.getStore_no(), year);
		jsonRoot.put("selectYear", year);
		return jsonRoot;
	}
	
	/**
	 * @author 김준혁
	 * ajax를 이용한 매출액 페이지에서  현재 설정된 매장의  클라이언트가 입력한 해당 연도 카테고리안에 메뉴별 판매된 횟수와 매출액을 호출
	 */
	@RequestMapping("/menu_countAndPrice/profit_owner")
	public @ResponseBody Object menuCountAndPriceProfitOwnerPOST(HttpServletRequest req, int year, int month) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMenuCountAndPrice(storeDto.getStore_no(), year, month);
		return jsonRoot;
	}
}
