package com.trycatch.owner.notice.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trycatch.owner.main.service.MemberService;

@Controller
public class NoticeController {
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping("/owner/notice.owner")
	public String home(Model model, HttpServletRequest req) throws Exception {
		logger.info("¿‘º∫");
		return "notice/Notice";
	}
}
