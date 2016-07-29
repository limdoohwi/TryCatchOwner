package com.trycatch.owner.notice.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.notice.domain.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.noticeMapper";
	@Override
	public List<NoticeDTO> getNoticeList() {
		return sqlSession.selectList(NAMESPACE + ".notice_list");
	}

	@Override
	public void deleteNotice(Integer notice_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".notice_delete", notice_num);
		sqlSession.delete(NAMESPACE +".notice_delete_reply", notice_num);
	}

	@Override
	public void insertNotice(NoticeDTO notice) throws Exception {
		sqlSession.update(NAMESPACE + ".notice_pos_up");
		sqlSession.insert(NAMESPACE + ".notice_insert", notice);
	}

	@Override
	public List<NoticeDTO> getNoticeReplyList() {
		
		return sqlSession.selectList(NAMESPACE + ".notice_reply_list");
	}

	@Override
	public void insertNoticeReply(NoticeDTO notice) throws Exception {
		sqlSession.update(NAMESPACE + ".notice_reply_pos_up", notice);
		sqlSession.insert(NAMESPACE + ".notice_reply_insert", notice);
	}

	@Override
	public void deleteReply(Integer notice_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".myreply_delete", notice_num);
	}
}
