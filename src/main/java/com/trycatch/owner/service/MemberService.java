package com.trycatch.owner.service;


import java.util.List;

import org.json.simple.JSONObject;

import com.trycatch.owner.domain.MemberDTO;


public interface MemberService {
	public MemberDTO login(String member_email, String member_pw) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception;
	public List<MemberDTO> getMember_email_like(String member_email) throws Exception;
}
