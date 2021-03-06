/*
 * 	Class: MemberService
 *  Description: MemberDAOImpl에서 받아온 Data를 가공하기 위한 Service
 *  Created: 2016­07­26
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-26 by Try{}Catch
 *
 *	Revisions:
 *		1. When & Who : 2016-08-04 by 임두휘
 *		2. What		  : 점주의 수를 계산하는 함수 추가
 */

package com.trycatch.owner.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	/**
	 * @author 김준혁
	 * trycoffee에서 tryowner로 이동한 클라이언트의 회원 번호를 받아 해당 회원의 정보를 호출
	 */
	@Override
	public MemberDTO getMember_Member_no(int member_no) throws Exception {
		return dao.getMember_no(member_no);
	}
	/**
	 * @author LimDooHwi
	 * 점주의 수 계산하는 함수
	 */
	@Override
	public int getMember_Count() {
		return dao.getMember_Count();
	}
}
