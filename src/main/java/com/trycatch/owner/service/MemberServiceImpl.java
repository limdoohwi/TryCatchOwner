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
	public boolean register(MemberDTO dto) throws Exception {
		if(dto.getMember_code() == 0){
			dto.setMember_code(1);
		}
		return dao.insertMember(dto);
	}

	@Override
	public MemberDTO login(String member_email, String member_pw) throws Exception{
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

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		List<MemberDTO> memberList = dao.getMemberList();
		return memberList;
	}

	@Override
	public List<MemberDTO> getMember_email_like(String member_email) throws Exception {
		List<MemberDTO> memberList =  dao.getMember_email_like(member_email);
		return memberList;
	}
	
	/**
	 * @author �?�??��
	 * 매장 추�??�� 방금 ?��?��?�� ?��?��?�� ?��보�?? DB?��?�� ?��출하?�� 메서?��
	 */
	@Override
	public JSONObject getCreate_owner() throws Exception {
		JSONObject jsonRoot = new JSONObject();
		MemberDTO dto = dao.getCreate_owner();
		jsonRoot.put("flag", "true");
		jsonRoot.put("member_no", dto.getMember_no());
		jsonRoot.put("member_name", URLEncoder.encode(dto.getMember_name(), "utf-8"));
		return jsonRoot;
	}
	
	/**
	 * @author �?�??��
	 * 매장 추�??��?�� 기존 ?��?�� �??�� ?�� List?�� ?���? MemberDTO�? json ?��?���? �??��
	 */
	@Override
	public JSONObject getSearchOnwerList(String member_email) throws Exception {
		JSONObject jsonRoot = new JSONObject();
		JSONArray jsonAl = new JSONArray();
		JSONObject jsonTemp = null;
		MemberDTO dto = null;
		List<MemberDTO> ownerList = dao.getMember_email_like(member_email);
		for(int i=0; i<ownerList.size(); i++){
			dto = ownerList.get(i);
			jsonTemp = new JSONObject();
			jsonTemp.put("member_no", dto.getMember_no());
			jsonTemp.put("member_name", URLEncoder.encode(dto.getMember_name(), "utf-8"));
			jsonTemp.put("member_email", dto.getMember_email());
			jsonTemp.put("member_code", dto.getMember_code());
			jsonAl.add(jsonTemp);
		}
		jsonRoot.put("ownerList", jsonAl);
		return  jsonRoot;
	}
	
	/**
	 * @author �?�??��
	 * 매장 추�??��?�� ?��?�� ?��?�� ?�� ?��?��?��?���? ?��메일?�� ?��?��받아 중복?��?�� ?��메일?�� ?��?���? ?��?��
	 */
	@Override
	public boolean isExistEmail(String member_email) throws Exception {
		MemberDTO dto = dao.getMember_email(member_email);
		if(dto == null){
			return false;
		}
		else{
			return true;
		}
	}
	
	@Override
	public boolean updateMember_pw(MemberDTO dto) throws Exception {
		return dao.updateMember_pw(dto);
	}
}
