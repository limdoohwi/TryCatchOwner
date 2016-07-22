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

import com.trycatch.owner.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) throws Exception {
		int member_no=7;
		req.getSession().setAttribute("member_dto", service.login(member_no));
		return "Main";
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
