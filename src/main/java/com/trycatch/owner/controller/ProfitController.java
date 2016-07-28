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
		logger.info("선택된 연도 : " + year);
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = service.getYearTotalPrice(storeDto.getStore_no(), year);
		return jsonRoot;
	}
}
