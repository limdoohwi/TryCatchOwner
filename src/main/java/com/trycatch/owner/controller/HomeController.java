/*
 *  Class: HomeController
 *  Description: Main에서 이동을 Control하는 페이지
 *  Created: 2016-07-15
 * 	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 *  Copyrights 2016-08-01 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-16 by 임두휘
 * 		2. What		  : 메신저 이동 함수 생성 
 * 
 * 		1. When & Who : 2016-07-20 by 박완석
 * 		2. What		  : 게시판 관련 함수 추가 
 * 
 * 		1. When & Who : 2016-07-25 by 김준혁
 * 		2. What		  : 매출액 및 미팅룸 관련  함수 추가 
 * 
 * 		1. When & Who : 2016-07-30 by 이준영
 * 		2. What		  : 공지사항 이동 함수 생성 
 * 
 * 		1. When & Who : 2016-08-03 by 김준혁
 * 		2. What		  : 최초 프로젝트 실행시 멥버값 session 저장 
 */
package com.trycatch.owner.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.MeetingRoomService;
import com.trycatch.owner.service.MemberService;
import com.trycatch.owner.service.StoreService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private MemberService service;
	@Inject
	private StoreService storeService;

	
	@Inject
	private MeetingRoomService meetingRoomService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * @author 김준혁
	 * 최초 프로젝트 실행시 세미 프로젝트에서 넘어온 회원 넘버를 받아와 session에 저장 후 
	 * 해당 점장의 매장 리스트를 호출
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, int member_no) throws Exception {
		MemberDTO member_dto = service.getMember_Member_no(member_no);
		req.getSession().setAttribute("member_dto", member_dto);
		//처음 로그인 후 접속할 때 설정된 매장은 보유 매장중 첫번째 매장
		if(member_dto.getMember_code()==2){
			if(req.getSession().getAttribute("store_dto") == null){
				List<StoreDTO> storeList =  storeService.getStoreList_member_no(member_dto.getMember_no());
				req.getSession().setAttribute("store_dto", storeList.get(0));
				req.getSession().setAttribute("storeList", storeService.getStoreList_member_no(member_dto.getMember_no()));							
			}
		}
		return "Main";
	}

	/**
	 *  @author LimDooHwi
	 *  메신저 페이지로 이동하는 함수
	 * 
	 */
	@RequestMapping("/messenger/TryCoffee_Owner")
	public void messengerGET() throws Exception{
	}
	/**
	 *  @author Leejunyung
	 *  모든 공지사항 글 불러오는 함수
	 */
	@RequestMapping("/notice/Notice")
	public void noticeGET(Model model) throws Exception{
	}
	/**
	 *  @author 박완석
	 *  게시판리스트 화면으로 전환하는 함수
	 */
	@RequestMapping("/community/Community_Owner")
	public void communityGET() throws Exception{
		
	}
	/**
	 *  @author 박완석
	 *  해당글 읽는화면으로 이동하는 함수
	 */
	@RequestMapping("/community/Community_Read")
	public void communityReadGET() throws Exception{
		
	}
	/**
	 *  @author 김준혁
	 *  주문내역들을 확인하는 함수
	 */
	@RequestMapping("/management/TryCoffee_Order")
	public void tryCoffee_OrderGET() throws Exception{
		
	}
	/**
	 *  @author 김준혁
	 *  미팅룸 화면으로 이동하는 함수
	 */
	@RequestMapping("/management/MeetingRoom")
	public void meetingRoomGET(HttpServletRequest req, Model model) throws Exception{
		StoreDTO dto = (StoreDTO)req.getSession().getAttribute("store_dto");
		model.addAttribute("meetingRoomReservationTodayList", meetingRoomService.getMeetingResrevationLIstToday_withStore_no(dto.getStore_no()));
	}
	/**
	 *  @author 김준혁
	 *  매출액 확인 화면으로 이동하는 함수
	 */
	@RequestMapping("/management/Profit_Owner")
	public void profit_OwnerGET() throws Exception{
	}
}
