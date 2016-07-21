package com.trycatch.owner.notice.persistence;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.main.domain.MemberDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.memberMapper";
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);

	@Override
	public List<MemberDTO> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO getMember_no(int member_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMember_no", member_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	@Override
	public List<MemberDTO> getMember_email_like(String member_email) {
		// TODO Auto-generated method stub
		return null;
	}
}
