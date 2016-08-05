/*
 * 	Class: NoticeDAOImpl
 *  Description: NoticeDAO 를 상속 받는 클래스로서 DB에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­07­26
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 *
 * 
 */

package com.trycatch.owner.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.noticeMapper";
	
	/**
	 * @author Leejunyung
	 * 모든 공지사항 글 불러오는 함수
	 */
	@Override
	public List<NoticeDTO> getNoticeList() {
		return sqlSession.selectList(NAMESPACE + ".notice_list");
	}

	/**
	 * @author Leejunyung
	 *공지사항 글 삭제 및 공지글 삭제시 해당되는 댓글 까지 삭제하는 함수
	 */
	@Override
	public void deleteNotice(Integer notice_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".notice_delete", notice_num);
	}

	/**
	 * @author Leejunyung
	 * 공지사항에 쓴 글을 저장하고, 현재 저장되 있는 글들의 포스를 하나씩 올려주는 함수
	 */
	@Override
	public void insertNotice(NoticeDTO notice) throws Exception {
		sqlSession.insert(NAMESPACE + ".notice_insert", notice);
	}

	/**
	 * @author Leejunyung
	 * 모든 공지사항 댓글 불러오는 함수
	 */
	@Override
	public List<NoticeDTO> getNoticeReplyList() {
		return sqlSession.selectList(NAMESPACE + ".notice_reply_list");
	}

	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 댓글을 저장하고, 해당글 보다 높은 포스의 번호를 하나씩 더 올려주는 함수
	 */
	@Override
	public void insertNoticeReply(NoticeDTO notice) throws Exception {
		sqlSession.insert(NAMESPACE + ".notice_reply_insert", notice);
	}

	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 해당하는 댓글 을 삭제하는 함수
	 */
	@Override
	public void deleteReply(Integer notice_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".reply_delete", notice_no);
	}
	/**
	 * @author LimDooHwi
	 * 해당 공지사항의 댓글의 갯수를 확인하는 함수
	 */
	@Override
	public int getReplyCount(int notice_parent_no) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".get_reply_count", notice_parent_no);
	}
	/**
	 * @author LimDooHwi
	 * 오늘 등록된 공지사항이 있는지 확인하는 함수
	 */
	@Override
	public int get_Notice_Count_New() {
		return sqlSession.selectOne(NAMESPACE+".get_Notice_Count_New");
	}
}
