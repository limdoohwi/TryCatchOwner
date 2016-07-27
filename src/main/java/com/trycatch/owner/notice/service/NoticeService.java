package com.trycatch.owner.notice.service;

import java.util.List;

import com.trycatch.owner.notice.domain.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> getNoticeList();
	public List<NoticeDTO> getNoticeReplyList();
	public void deleteNotice(Integer notice_num) throws Exception;
	public void insertNotice(NoticeDTO notice, String notice_content) throws Exception;
	public void insertNoticeReply(NoticeDTO notice, String notice_content, int notice_pos, int notice_group) throws Exception;
	public void deleteReply(Integer notice_num) throws Exception;
}
