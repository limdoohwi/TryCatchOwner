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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.MessengerContentDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.MeetingRoomService;
import com.trycatch.owner.service.MemberService;
import com.trycatch.owner.service.MessengerService;
import com.trycatch.owner.service.NoticeService;
import com.trycatch.owner.service.OrderService;
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
	private MessengerService messengerService;
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private MeetingRoomService meetingRoomService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, int member_no) throws Exception {
		MemberDTO member_dto = service.getMember_Member_no(member_no);
		req.getSession().setAttribute("member_dto", member_dto);
		//처음 로그인 후 접속할 때 설정된 매장은 보유 매장중 첫번째 매장
		if(req.getSession().getAttribute("store_dto") == null){
			List<StoreDTO> storeList =  storeService.getStoreList_member_no(member_dto.getMember_no());
			req.getSession().setAttribute("store_dto", storeList.get(0));
			req.getSession().setAttribute("storeList", storeService.getStoreList_member_no(member_dto.getMember_no()));							
		}
		return "Main";
	}

	
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
	
	@RequestMapping("/community/Community_Owner")
	public void communityGET() throws Exception{
		
	}
	@RequestMapping("/community/Community_Read")
	public void communityReadGET() throws Exception{
		
	}
	
	@RequestMapping("/management/TryCoffee_Order")
	public void tryCoffee_OrderGET() throws Exception{
		
	}
	
	@RequestMapping("/management/MeetingRoom")
	public void meetingRoomGET(HttpServletRequest req, Model model) throws Exception{
		StoreDTO dto = (StoreDTO)req.getSession().getAttribute("store_dto");
		model.addAttribute("meetingRoomReservationTodayList", meetingRoomService.getMeetingResrevationLIstToday_withStore_no(dto.getStore_no()));
	}
	
	@RequestMapping("/management/Profit_Owner")
	public void profit_OwnerGET() throws Exception{
	}
}
