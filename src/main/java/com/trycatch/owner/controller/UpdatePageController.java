/*
 * 	Class: UpdatePageController
 *  Description: 새로운 정보가 들어왔을 경우 페이지를 변경하는 메서드를 관리하는 컨트롤러
 *  Created: 2016­08-04
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-20 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-30
 * 		2. What		  : 댓글 및 공지사항 삭제시 해당되는 댓글삭제
 * 
 */
package com.trycatch.owner.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MeetingRoomDTO;
import com.trycatch.owner.service.CommunityService;
import com.trycatch.owner.service.MeetingRoomService;
import com.trycatch.owner.service.MemberService;
import com.trycatch.owner.service.NoticeService;
import com.trycatch.owner.service.OrderService;
import com.trycatch.owner.service.ProfitService;
import com.trycatch.owner.service.StoreService;

@Controller
public class UpdatePageController {
	@Inject
	OrderService orderservice;
	@Inject
	ProfitService profitservice;
	@Inject
	MemberService memberservice;
	@Inject
	MeetingRoomService meetingroomservice;
	@Inject
	StoreService storeservice;
	@Inject
	NoticeService noticeservice;
	@Inject
	CommunityService communityservice;
	
	@RequestMapping("/websocket/list")
	public @ResponseBody Object updatepage(int member_no, int store_no) throws Exception{
		int todayorder = orderservice.getordertodayCount(store_no);
		int ownercount = memberservice.getMember_Count();
		int todaymeetingroom = 0;
		List<MeetingRoomDTO> list = meetingroomservice.getMeetingResrevationLIstToday_withStore_no(store_no);
		for(int i=0; i<list.size();i++){
			System.out.println(list.get(i).getMember_name());
			if(!list.get(i).getMember_name().equals("없음")){
				todaymeetingroom++;
			}
		}
		JSONObject jsonRoot = profitservice.getMonthProfit(store_no, member_no);
		Date date = new Date();
		int month = date.getMonth();
		JSONArray arry = (JSONArray)jsonRoot.get("profitMonthList");
		jsonRoot =(JSONObject)arry.get(month);
		String menuAndPrice = (String)jsonRoot.get("profitMenu");
		String[] firstParsing = menuAndPrice.split("/");
		int total_price = 0;
		for(int i=0; i<firstParsing.length; i++){
			String[] secondParsing = firstParsing[i].split(",");
			total_price += Integer.parseInt(secondParsing[1]);
		}
		JSONObject obj = new JSONObject();
		obj.put("todayorder", todayorder);
		obj.put("ownercount", ownercount);
		obj.put("todaymeetingroom", todaymeetingroom);
		obj.put("thisMonthProfit", total_price);
		return obj;
	}
	@RequestMapping("/websocket/new")
	public @ResponseBody Object updatenew() throws Exception{
		boolean noticeNew = false;
		boolean communityNew = false;
		if(noticeservice.get_Notice_Count_New()>0){
			noticeNew = true;
		}
		if(communityservice.get_Community_Count_New()>0){
			communityNew = true;
		}
		JSONObject obj = new JSONObject();
		obj.put("noticeNew", noticeNew);
		obj.put("communityNew", communityNew);
		return obj;
	}
}
