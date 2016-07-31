package com.trycatch.owner.persistence;

import java.util.List;
import java.util.Map;

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
		sqlSession.delete(NAMESPACE +".notice_delete_reply", notice_num);
	}

	/**
	 * @author Leejunyung
	 * 공지사항에 쓴 글을 저장하고, 현재 저장되 있는 글들의 포스를 하나씩 올려주는 함수
	 */
	@Override
	public void insertNotice(NoticeDTO notice) throws Exception {
		sqlSession.update(NAMESPACE + ".notice_pos_up");
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
		sqlSession.update(NAMESPACE + ".notice_reply_pos_up", notice);
		sqlSession.insert(NAMESPACE + ".notice_reply_insert", notice);
	}

	/**
	 * @author Leejunyung
	 * 해당하는 공지사항에 단 해당하는 댓글 을 삭제하는 함수
	 */
	@Override
	public void deleteReply(Integer notice_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".myreply_delete", notice_num);
	}
}
