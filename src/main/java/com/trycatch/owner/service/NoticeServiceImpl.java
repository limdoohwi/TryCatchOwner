/*
 * 	Class: NoticeServiceImpl
 *  Description: NoticeService 를 상속 받는 클래스로서 MessengerDAO에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­07­28
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 *
 *  Revisions:
 * 		1. When & Who : 2016-08-02 by 임두휘
 * 		2. What		  : 댓글 개수를 읽어 오는 함수 추가
 * 		
 * 		1. When & Who : 2016-08-04 by 임두휘
 * 		2. What		  : 오늘 등록된 공지사항이 있는지 확인하는 함수 추가 
 */
package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.support.ReplaceOverride;
import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.NoticeDTO;
import com.trycatch.owner.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;
	
	/**
	 * @author Leejunyung
	 * 모든 공지사항 글 불러오는 함수
	 */
	@Override
	public List<NoticeDTO> getNoticeList() {
		return dao.getNoticeList();
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항 글 삭제 및 공지글 삭제시 해당되는 댓글 까지 삭제하는 함수
	 */
	@Override
	public void deleteNotice(Integer notice_no) throws Exception {
		dao.deleteNotice(notice_no);
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항에 쓴 글을 줄 바꿈을 jsp의 줄바꿈으로 바꿔 저장하는 함수
	 */
	@Override
	public void insertNotice(int member_no, String notice_content) throws Exception {
		NoticeDTO noticeDto = new NoticeDTO();
		System.out.println(member_no + " : " +notice_content);
		String replace_notice_content = notice_content.replace("\n", "<br>");
		noticeDto.setNotice_content(replace_notice_content);
		noticeDto.setMember_no(member_no);
		dao.insertNotice(noticeDto);
	}

	/**
	 * @author Leejunyung
	 * 모든 공지사항 댓글을 불러오는 함수
	 */
	@Override
	public List<NoticeDTO> getNoticeReplyList() {
		return dao.getNoticeReplyList();
	}
	
	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 댓글을 저장하는 함수
	 */
	@Override
	public void insertNoticeReply(int notice_parent_no, int member_no, String notice_content) throws Exception {
		NoticeDTO noticeDto = new NoticeDTO();
		String replace_notice_content = notice_content.replace("\n", "<br>");
		noticeDto.setNotice_content(replace_notice_content);
		noticeDto.setMember_no(member_no);
		noticeDto.setNotice_parent_no(notice_parent_no);
		dao.insertNoticeReply(noticeDto);
	}

	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 해당하는 댓글 을 삭제하는 함수
	 */
	@Override
	public void deleteReply(Integer notice_no) throws Exception {
		dao.deleteReply(notice_no);
	}
	/**
	 * @author LimDooHwi
	 * 해당 공지사항에 해당하는 댓글의 갯수를 새오는 함수
	 */
	@Override
	public int getReplyCount(int notice_parent_no) throws Exception {
		return dao.getReplyCount(notice_parent_no);
	}
	/**
	 * @author LimDooHwi
	 * 오늘 등록된 공지사항이 있는지 확인하는 함수
	 */
	@Override
	public int get_Notice_Count_New() {
		return dao.get_Notice_Count_New();
	}

}
