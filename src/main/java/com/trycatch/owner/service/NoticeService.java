/*
 * 	Interface: NoticeService
 *  Description: Notice와의 연결을 담당하는 Service 클래스
 *  Created: 2016­07­28
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 *
 */
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
	public int get_Notice_Count_New();
}
