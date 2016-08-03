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
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trycatch.owner.domain.NoticeDTO;
import com.trycatch.owner.service.NoticeService;

@Controller
public class NoticeController {
	@Inject
	private NoticeService service;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	/**
	 * @author LimDooHwi
	 * 공지사항 리스트를 Ajax로 뿌리는 함수 
	 * @throws Exception 
	 */
	@RequestMapping("/notice/list")
	public @ResponseBody Object list() throws Exception{
		logger.info("list 들어옴");
		List<NoticeDTO> noticeList = service.getNoticeList();
		for(int i=0; i<noticeList.size();i++){
			noticeList.get(i).setReply_count(service.getReplyCount(noticeList.get(i).getNotice_no()));
		}
		List<NoticeDTO> noticereplyList = service.getNoticeReplyList();
		JSONObject obj = new JSONObject();
		obj.put("noticeList", noticeList);
		obj.put("noticereplyList", noticereplyList);
		return obj;
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항 글 삭제 및 공지글 삭제시 해당되는 댓글 까지 삭제하는 함수
	 * @author LimDooHwi
	 * Ajax화
	 */
	@RequestMapping("/notice/delete")
	public @ResponseBody Object delete(int notice_no) throws Exception{
		service.deleteNotice(notice_no);
		List<NoticeDTO> noticeList = service.getNoticeList();
		for(int i=0; i<noticeList.size();i++){
			noticeList.get(i).setReply_count(service.getReplyCount(noticeList.get(i).getNotice_no()));
		}
		List<NoticeDTO> noticereplyList = service.getNoticeReplyList();
		JSONObject obj = new JSONObject();
		obj.put("noticeList", noticeList);
		obj.put("noticereplyList", noticereplyList);
		return obj;
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항 글 저장하는 함수
	 * @author LimDooHwi
	 * Ajax화
	 */
	
	@RequestMapping("/notice/insert")
	public @ResponseBody Object insert(int member_no, String notice_content) throws Exception{
		service.insertNotice(member_no, notice_content);
		List<NoticeDTO> noticeList = service.getNoticeList();
		for(int i=0; i<noticeList.size();i++){
			noticeList.get(i).setReply_count(service.getReplyCount(noticeList.get(i).getNotice_no()));
		}
		List<NoticeDTO> noticereplyList = service.getNoticeReplyList();
		JSONObject obj = new JSONObject();
		obj.put("noticeList", noticeList);
		obj.put("noticereplyList", noticereplyList);
		return obj;
	}
	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 댓글을 저장하는 함수
	 */
	@RequestMapping("/notice/reply/insert")
	public @ResponseBody Object insertReply(int notice_no, String notice_content, int member_no) throws Exception{
		logger.info("reply_insert 들어옴");
		service.insertNoticeReply(notice_no,member_no, notice_content);
		List<NoticeDTO> noticeList = service.getNoticeList();
		for(int i=0; i<noticeList.size();i++){
			noticeList.get(i).setReply_count(service.getReplyCount(noticeList.get(i).getNotice_no()));
		}
		List<NoticeDTO> noticereplyList = service.getNoticeReplyList();
		JSONObject obj = new JSONObject();
		obj.put("noticeList", noticeList);
		obj.put("noticereplyList", noticereplyList);
		return obj;
	}
	
	
	
	
	
}
