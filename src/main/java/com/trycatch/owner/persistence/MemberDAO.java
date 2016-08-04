/*
 * 	Class: MemberDAO
 *  Description: Member Table과의 DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­26
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-26 by Try{}Catch
 *
 *	Revisions:
 */


package com.trycatch.owner.persistence;


import com.trycatch.owner.domain.MemberDTO;



public interface MemberDAO {
	public MemberDTO getMember_no(int member_no);
}
