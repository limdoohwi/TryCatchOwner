/*
 * 	Interface: NoticeDAO 
 *  Description: Notice에 관련된 DB연결을 담당하는 Interface
 *  Created: 2016­07­28
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 */
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
	public int getReplyCount(int notice_parent_no) throws Exception;
	public int get_Notice_Count_New();
}
