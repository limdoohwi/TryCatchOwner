/*
 * 	Class: OrderController
 *  Description: trycoffee 웹서비스에서 클라이언트가 음료 주문한 예약 리스트를 호출하는 Controller
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

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

@Controller
public class OrderController {
	@Inject
	private OrderService orderService;
	
	/**
	 * @author 김준혁
	 * ajax 및 웹소켓 통신을 이용하여 현재 웹서비스에 접속중인 점장이 담당하는 매장의 음료주문 내역을 DB에서 호출
	 */
	@RequestMapping("/client_order_list/order")
	public @ResponseBody Object setStorePOST(HttpServletRequest req, int start_Page, String search_order_info) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = new JSONObject();
		boolean asce = false;
		//오름차순일 경우
		if(req.getParameter("asce") != null){
			asce = true;
		}
		jsonRoot.put("orderList", orderService.getOrder_Information(storeDto.getStore_no(), start_Page, asce, search_order_info));
		return jsonRoot;
	}
	
	@RequestMapping("/order/alarm")
	public @ResponseBody Object getOrderAlarmList(int member_no){
		JSONObject obj = new JSONObject();
		obj.put("orderalarmList", orderService.getOrderAlarmList(member_no));
		return obj;
	}
}
