package com.trycatch.owner.service;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

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
	
	@Override
	public MemberDTO login(String member_email, String member_pw) throws Exception {
		MemberDTO dto =dao.getMember_email(member_email);
		if(dto!=null){
				if(dto.getMember_pw().equals(member_pw)){
					return dto;
				}
				else{
					return null;
				}
		}
		else{
			return null;
		}
	}
}
