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
import com.trycatch.owner.service.MenuService;
import com.trycatch.owner.service.ProfitService;

@Controller
public class ProfitController {
	@Inject
	private ProfitService service;
	@Inject
	private MenuService menuService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfitController.class);
	
	@RequestMapping("/month_profit/main/chart")
	public @ResponseBody Object monthProfitInMainPOST(HttpServletRequest req) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthProfit(storeDto.getStore_no(), memberDto.getMember_no());
		jsonRoot.put("categoryList", menuService.getMenuCategoryList());
		return jsonRoot;
	}
	
	@RequestMapping("/year_profit/main/chart")
	public @ResponseBody Object yearProfitInMainPOST(HttpServletRequest req) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearProfit(storeDto.getStore_no(), memberDto.getMember_no());
		jsonRoot.put("categoryList", menuService.getMenuCategoryList());
		return jsonRoot;
	}
	
	@RequestMapping("/year_profit/profit_owner")
	public @ResponseBody Object yearProfitOwnerPOST(HttpServletRequest req, int year) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		return service.getYearTotalPrice(storeDto.getStore_no(), year);
	}
	
	@RequestMapping("/years_profit/profit_owner")
	public @ResponseBody Object yearsProfitOwnerPOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		return service.getYearsTotalPrice(storeDto.getStore_no());
	}
	
	@RequestMapping("/month_profit/profit_owner")
	public @ResponseBody Object monthProfitOwnerPOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthTotalPrice(storeDto.getStore_no());
		return jsonRoot;
	}
	
	@RequestMapping("/year_reservation_drink/profit_owner")
	public @ResponseBody Object yearReservationDrinkOwnerPOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearReservationDrink(storeDto.getStore_no());
		return jsonRoot;
	}
	
	@RequestMapping("/month_reservation_drink/profit_owner")
	public @ResponseBody Object monthReservationDrinkOwnerPOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getMonthReservationDrink(storeDto.getStore_no());
		return jsonRoot;
	}
	
	@RequestMapping("/day_reservation_drink/profit_owner")
	public @ResponseBody Object dayReservationDrinkOwnerPOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getDayAverageReservationDrink(storeDto.getStore_no());
		return jsonRoot;
	}
	
	@RequestMapping("/year_menu_percentage/profit_owner")
	public @ResponseBody Object yearMenuPercentageOwnerPOST(HttpServletRequest req, int year, String yearProfit) throws Exception{
		System.out.println(yearProfit + "********************************************" );
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearMenuPercentager(storeDto.getStore_no(), year, yearProfit);
		return jsonRoot;
	}
	
	
}
