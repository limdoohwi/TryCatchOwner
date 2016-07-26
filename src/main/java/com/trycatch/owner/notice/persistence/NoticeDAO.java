package com.trycatch.owner.notice.persistence;

import java.util.List;

import com.trycatch.owner.notice.domain.NoticeDTO;



public interface NoticeDAO {
	public List<NoticeDTO> getNoticeList();
	public List<NoticeDTO> getNoticeReplyList( int notice_num);
	public void deleteNotice(Integer notice_num) throws Exception;
	public void insertNotice(NoticeDTO notice) throws Exception;
	public void insertNoticeReply(NoticeDTO notice ) throws Exception;	
}
