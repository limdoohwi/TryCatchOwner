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
	
	@RequestMapping("/meetingRoom_list/meetingRoom/owner")
	public @ResponseBody Object setStorePOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("meetingRoomList", service.getMeetingResrevationLIst_withStore_no(storeDto.getStore_no()));
		return jsonRoot;
	}
}
