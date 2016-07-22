package com.trycatch.owner.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trycatch.owner.service.CommunityService;

@Controller
public class CommunityController {
	private CommunityService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/community/Community_Read", method=RequestMethod.GET)
	public String Community_Read(){
		return "/community/Community_Read";
		
	}
}
