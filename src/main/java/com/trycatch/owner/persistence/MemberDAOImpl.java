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
	
	private static final String NAMESPACE = "com.trycatch.coffee.mappers.memberMapper";
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Override
	public boolean insertMember(MemberDTO dto) {
		// TODO ?öå?õê Í∞??ûÖ DB?ó∞Í≤?
		try{
			sqlSession.insert(NAMESPACE+".insertMember", dto);
			return true;
		}
		catch(Exception err){
			return false;
		}
		
	}

	@Override
	public void deleteMember(int member_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MemberDTO> getMemberList() {
		try{
			return sqlSession.selectList(NAMESPACE + ".getMemberList");
		}catch(Exception err){
			return null;
		}
	}

	@Override
	public MemberDTO getMember_no(int member_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO getMember_email(String member_email) {
		try{
			return sqlSession.selectOne(NAMESPACE + ".getMember_email", member_email);
		}
		catch(Exception err){
			return null;
		}
		
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
			return null;
		}
	}

	@Override
	public List<MemberDTO> getMember_email_like(String member_email) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMember_email_like", member_email);
		}
		catch (Exception err) {
			return null;
		}
	}

	@Override
	public MemberDTO getCreate_owner() {
		try {
			List<MemberDTO> list = sqlSession.selectList(NAMESPACE + ".getCreate_owner");
			MemberDTO dto = list.get(0);
			return dto;
		} 
		catch (Exception err) {
			return null;
		}
	}
	
	@Override
	public boolean updateMember_pw(MemberDTO dto) {
		try {
			sqlSession.update(NAMESPACE + ".updateMeber_Pw", dto);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
}
