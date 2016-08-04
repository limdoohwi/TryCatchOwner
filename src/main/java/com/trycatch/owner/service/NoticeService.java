package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> getNoticeList();
	public List<NoticeDTO> getNoticeReplyList();
	public void deleteNotice(Integer notice_no) throws Exception;
	public void insertNotice(int member_no, String notice_content) throws Exception;
	public void insertNoticeReply(int notice_parent_no, int member_no, String notice_content) throws Exception;
	public void deleteReply(Integer notice_no) throws Exception;
	public int getReplyCount(int notice_parent_no) throws Exception;
}
