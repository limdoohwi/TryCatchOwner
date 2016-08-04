/*
 * 	Class: MemberService
 *  Description: MemberDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­26
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-26 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.service;


import com.trycatch.owner.domain.MemberDTO;


public interface MemberService {
	public MemberDTO getMember_Member_no(int member_no) throws Exception;
}
