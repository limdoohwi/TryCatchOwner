package com.trycatch.owner.main.service;


import java.util.List;

import org.json.simple.JSONObject;

import com.trycatch.owner.main.domain.MemberDTO;


public interface MemberService {
	public MemberDTO login(int member_no) throws Exception;
	public List<MemberDTO> getMemberList() throws Exception;
	public List<MemberDTO> getMember_email_like(String member_email) throws Exception;
}
