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
	public void deleteNotice(Integer notice_num) throws Exception {
		dao.deleteNotice(notice_num);
	}
	
	/**
	 * @author Leejunyung
	 * 공지사항에 쓴 글을 줄 바꿈을 jsp의 줄바꿈으로 바꿔 저장하는 함수
	 */
	@Override
	public void insertNotice(NoticeDTO notice, String notice_content) throws Exception {
		String replace_notice_content = notice_content.replace("\n", "<br>");
		notice.setNotice_content(replace_notice_content);
		dao.insertNotice(notice);
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
	public void insertNoticeReply(NoticeDTO notice, String notice_content,int notice_pos, int notice_group) throws Exception {
		String replace_notice_content = notice_content.replace("\n", "<br>");
		notice.setNotice_content(replace_notice_content);
		notice.setNotice_pos(notice_pos);
		notice.setNotice_group(notice_group);
		dao.insertNoticeReply(notice);
	}

	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 해당하는 댓글 을 삭제하는 함수
	 */
	@Override
	public void deleteReply(Integer notice_num) throws Exception {
		dao.deleteReply(notice_num);
	}

}
