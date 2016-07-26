package com.trycatch.owner.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
import com.trycatch.owner.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	
	//·Î±×ÀÎ ¤·¤·
	@RequestMapping(value = "/log_in", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			String member_email = req.getParameter("member_email");
			String member_pw = req.getParameter("member_pw");
			System.out.println(member_email+member_pw);
			MemberDTO member_dto =service.login(member_email, member_pw);
			
			if(member_dto==null){
				rttr.addFlashAttribute("login_success", false);
				return "redirect:/";
			}
			else{
				rttr.addFlashAttribute("login_success", true);
				req.getSession().setAttribute("member_dto", member_dto);
				
				return "redirect:/log_in";
			}
		}
	
	@RequestMapping(value = "/log_in", method = RequestMethod.GET)
	public String log_in() throws Exception {
		return "Main";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {
		return "log_in";
	}
	
	@RequestMapping("/messenger/TryCoffee_Owner")
	public void messengerGET() throws Exception{
	}
	
//	@RequestMapping("/notice/Notice")
//	public void noticeGET(Model model) throws Exception{
		
//	}
	
	@RequestMapping("/community/Community_Owner")
	public void communityGET() throws Exception{
		
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
