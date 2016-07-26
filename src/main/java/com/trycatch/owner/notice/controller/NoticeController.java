package com.trycatch.owner.notice.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trycatch.owner.notice.domain.NoticeDTO;
import com.trycatch.owner.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Inject
	private NoticeService service;
	
	@RequestMapping("/notice/Notice")
	public void listAll(Model model, NoticeDTO notice)throws Exception{
		model.addAttribute("notice_list", service.getNoticeList());
		ArrayList list = (ArrayList) service.getNoticeList();
		System.out.println(list.get(1));
		//model.addAttribute("notice_reply_list", service.getNoticeReplyList(notice_num))
	}
	
	@RequestMapping("/notice.delete")
	public String delete(int notice_num,RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		notice_num = Integer.parseInt(req.getParameter("notice_num"));
		service.deleteNotice(notice_num);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	@RequestMapping("/notice.insert")
	public String insert(NoticeDTO notice,RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		String notice_content;
		notice_content = req.getParameter("notice_content");
		service.insertNotice(notice, notice_content);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	@RequestMapping("/notice.reply.insert")
	public String insertReply(NoticeDTO notice,RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		String notice_content = req.getParameter("reply_content");
		int notice_pos = Integer.parseInt(req.getParameter("notice_pos"));
		int notice_group = Integer.parseInt(req.getParameter("notice_num"));
		service.insertNoticeReply(notice, notice_content , notice_pos, notice_group);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	
}
