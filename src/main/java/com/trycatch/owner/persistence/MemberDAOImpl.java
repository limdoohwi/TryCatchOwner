package com.trycatch.owner.persistence;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.memberMapper";
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

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
	
	@Override
	public MemberDTO getMember_WithPW(String member_email, String member_pw) {
		try{
			Map<String, Object> map = new HashMap<>();
			map.put("member_email", member_email);
			map.put("member_pw", member_pw);
			return sqlSession.selectOne("getMember_WithPW",map);
		}
		catch(Exception err){
			err.printStackTrace();
			return null;
		}
	}
	
	@Override
	public MemberDTO getMember_email(String member_email) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMember_email", member_email);
		}
		catch (Exception err) {
			return null;
		}
	}
}
