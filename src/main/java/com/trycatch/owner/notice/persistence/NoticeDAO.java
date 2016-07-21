package com.trycatch.owner.notice.persistence;

import java.util.List;

import com.trycatch.owner.main.domain.MemberDTO;



public interface NoticeDAO {
	public List<MemberDTO> getMemberList();
	public MemberDTO getMember_no(int member_no);
	public List<MemberDTO> getMember_email_like(String member_email);
}
