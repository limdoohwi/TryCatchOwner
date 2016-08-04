/*
 * 	Class: MeetingRoomController
 *  Description: trycoffee 웹서비스에서 클라이언트가 미팅룸을 예약한 리스트를 호출하는 Controller
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
import com.trycatch.owner.service.MeetingRoomService;
import com.trycatch.owner.service.OrderService;

@Controller
public class MeetingRoomController {
	@Inject
	private MeetingRoomService service;
	
	/**
	 *@author 김준혁
	 *현재 웹서비스에 설정된 매장의 미팅룸 예약 리스트를 호출 
	 */
	@RequestMapping("/meetingRoom_list/meetingRoom/owner")
	public @ResponseBody Object setStorePOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("meetingRoomList", service.getMeetingResrevationLIst_withStore_no(storeDto.getStore_no()));
		return jsonRoot;
	}
}
