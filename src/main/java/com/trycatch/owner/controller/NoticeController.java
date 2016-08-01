/*
 * 	Class: MessengerController
 *  Description: Notice에 관련된 메서드를 관리하는 컨트롤러
 *  Created: 2016­07­20
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-20 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-30
 * 		2. What		  : 댓글 및 공지사항 삭제시 해당되는 댓글삭제
 * 
 */
package com.trycatch.owner.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trycatch.owner.domain.NoticeDTO;
import com.trycatch.owner.service.NoticeService;

@Controller
public class NoticeController {
	@Inject
	private NoticeService service;
	
	/**
	 * @author Leejunyung
	 * 모든 공지사항 글 불러오는 함수
	 */
	@RequestMapping("/notice/Notice")
	public void listAll(Model model, NoticeDTO notice, HttpServletRequest req)throws Exception{
		model.addAttribute("notice_list", service.getNoticeList());
		model.addAttribute("notice_reply_list", service.getNoticeReplyList());
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항 글 삭제 및 공지글 삭제시 해당되는 댓글 까지 삭제하는 함수
	 */
	@RequestMapping("/notice/delete")
	public String delete(int notice_num,RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		notice_num = Integer.parseInt(req.getParameter("notice_num"));
		service.deleteNotice(notice_num);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항 글 저장하는 함수
	 */
	
	@RequestMapping("/notice/insert")
	public String insert(NoticeDTO notice,RedirectAttributes rttr, HttpServletRequest req, String member_name) throws Exception{
		String notice_content;
		notice_content = req.getParameter("notice_content");
		member_name = req.getParameter("member_name");
		notice.setMember_name(member_name);
		service.insertNotice(notice, notice_content);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 댓글을 저장하는 함수
	 */
	@RequestMapping("/notice/reply_insert")
	public String insertReply(NoticeDTO notice,RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		String notice_content = req.getParameter("reply_content");
		int notice_pos = Integer.parseInt(req.getParameter("notice_pos"));
		int notice_group = Integer.parseInt(req.getParameter("notice_num"));
		String member_name = req.getParameter("reply_member_name");
		notice.setMember_name(member_name);
		service.insertNoticeReply(notice, notice_content , notice_pos, notice_group);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 해당하는 댓글 을 삭제하는 함수
	 */
	@RequestMapping("/notice/reply_delete")
	public String deleteReply(RedirectAttributes rttr, HttpServletRequest req) throws Exception{
		int notice_num = Integer.parseInt(req.getParameter("reply_delete_num"));
		service.deleteReply(notice_num);;
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/Notice";
	}
	
	
}
