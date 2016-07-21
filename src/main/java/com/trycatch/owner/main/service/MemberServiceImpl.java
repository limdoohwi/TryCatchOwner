package com.trycatch.owner.main.service;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.trycatch.owner.main.domain.MemberDTO;
import com.trycatch.owner.main.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Override
	public MemberDTO login(int member_no) throws Exception {
		return dao.getMember_no(member_no);
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDTO> getMember_email_like(String member_email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
