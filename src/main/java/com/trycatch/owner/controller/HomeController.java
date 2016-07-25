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
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.MemberService;
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
	private OrderService orderService;
	@Inject
	private StoreService storeService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "/log_in", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			String member_email = req.getParameter("member_email");
			String member_pw = req.getParameter("member_pw");
			MemberDTO member_dto =service.login(member_email, member_pw);
			
			if(member_dto==null){
				rttr.addFlashAttribute("login_success", false);
				return "redirect:/";
			}
			else{
				rttr.addFlashAttribute("login_success", true);
				req.getSession().setAttribute("member_dto", member_dto);
				//처음 로그인 후 접속할 때 설정된 매장은 보유 매장중 첫번째 매장
				List<StoreDTO> storeList =  storeService.getStoreList_member_no(member_dto.getMember_no());
				req.getSession().setAttribute("store_dto", storeList.get(0));
				req.getSession().setAttribute("storeList", storeService.getStoreList_member_no(member_dto.getMember_no()));							
				return "redirect:/log_in";
			}
		}
	
	@RequestMapping(value = "/log_in", method = RequestMethod.GET)
	public String log_in(HttpServletRequest req, Model model) throws Exception {
		MemberDTO dto = (MemberDTO)req.getSession().getAttribute("member_dto");
		//클라이언트가 주문한 내역 호출
		model.addAttribute("orderList", orderService.getOrder_Information(dto.getMember_no()));
		return "Main";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {
		return "log_in";
	}
	
	@RequestMapping("/messenger/TryCoffee_Owner")
	public void messengerGET() throws Exception{
	}
	
	@RequestMapping("/notice/Notice")
	public void noticeGET() throws Exception{
		
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
	public void meetingRoomGET() throws Exception{
		
	}
	
	@RequestMapping("/management/Profit_Owner")
	public void profit_OwnerGET() throws Exception{
		
	}
}
