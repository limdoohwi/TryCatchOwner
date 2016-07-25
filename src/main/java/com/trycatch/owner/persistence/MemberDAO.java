package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MemberDTO;



public interface MemberDAO {
	public List<MemberDTO> getMemberList();
	public MemberDTO getMember_no(int member_no);
	public List<MemberDTO> getMember_email_like(String member_email);
	public MemberDTO getMember_WithPW(String member_email,String member_pw);
	public MemberDTO getMember_email(String member_email);
}
