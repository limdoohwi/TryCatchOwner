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
	
	@Override
	public List<NoticeDTO> getNoticeList() {
		return dao.getNoticeList();
	}

	@Override
	public void deleteNotice(Integer notice_num) throws Exception {
		dao.deleteNotice(notice_num);
	}

	@Override
	public void insertNotice(NoticeDTO notice, String notice_content) throws Exception {
		String replace_notice_content = notice_content.replace("\n", "<br>");
		notice.setNotice_content(replace_notice_content);
		dao.insertNotice(notice);
	}

	@Override
	public List<NoticeDTO> getNoticeReplyList() {
		return dao.getNoticeReplyList();
	}

	@Override
	public void insertNoticeReply(NoticeDTO notice, String notice_content,int notice_pos, int notice_group) throws Exception {
		String replace_notice_content = notice_content.replace("\n", "<br>");
		notice.setNotice_content(replace_notice_content);
		notice.setNotice_pos(notice_pos);
		notice.setNotice_group(notice_group);
		dao.insertNoticeReply(notice);
	}

	@Override
	public void deleteReply(Integer notice_num) throws Exception {
		dao.deleteReply(notice_num);
	}

}
