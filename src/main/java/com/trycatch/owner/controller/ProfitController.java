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
		logger.info("ProfitController 시작");
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("menuCategoryList", menuService.getMenuCategoryList());
		jsonRoot.put("profitMonthList", service.getMonthProfit(storeDto.getStore_no(), memberDto.getMember_no()));
		return jsonRoot;
	}
}
