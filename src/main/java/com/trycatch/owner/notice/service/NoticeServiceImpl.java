package com.trycatch.owner.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.notice.domain.NoticeDTO;
import com.trycatch.owner.notice.persistence.NoticeDAO;

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
		notice.setNotice_content(notice_content);
		dao.insertNotice(notice);
	}

	@Override
	public List<NoticeDTO> getNoticeReplyList(int notice_num) {
		return dao.getNoticeReplyList(notice_num);
	}

	@Override
	public void insertNoticeReply(NoticeDTO notice, String notice_content,int notice_pos, int notice_group) throws Exception {
		notice.setNotice_content(notice_content);
		notice.setNotice_pos(notice_pos);
		notice.setNotice_group(notice_group);
		dao.insertNoticeReply(notice);
	}

}
