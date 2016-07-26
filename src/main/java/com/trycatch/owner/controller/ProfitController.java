package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.OrderService;
import com.trycatch.owner.service.ProfitService;

@Controller
public class ProfitController {
	@Inject
	private ProfitService service;

	
	@RequestMapping("/month_profit/main/chart")
	public @ResponseBody Object monthProfitInMainPOST(HttpServletRequest req) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto= (StoreDTO)req.getSession().getAttribute("store_dto");
		return service.getMonthProfit(storeDto.getStore_no(), memberDto.getMember_no());
	}
}
