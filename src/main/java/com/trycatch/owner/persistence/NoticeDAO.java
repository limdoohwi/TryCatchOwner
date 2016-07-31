package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.NoticeDTO;



public interface NoticeDAO {
	public List<NoticeDTO> getNoticeList();
	public List<NoticeDTO> getNoticeReplyList();
	public void deleteNotice(Integer notice_num) throws Exception;
	public void insertNotice(NoticeDTO notice) throws Exception;
	public void insertNoticeReply(NoticeDTO notice ) throws Exception;
	public void deleteReply(Integer notice_num) throws Exception;
}
