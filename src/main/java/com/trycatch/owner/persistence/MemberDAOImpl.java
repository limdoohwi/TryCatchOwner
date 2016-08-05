/*
 * 	Class: MemberDAOImpl
 *  Description: Member Table과의 DB작업을 하기 위한 Repository
 *  Created: 2016­07­26
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-26 by Try{}Catch
 *
 *	Revisions:
 *
 *	1.When & Who : 2016-08-04 by 임두휘
 *  2.What       : 점주 수를 계산하는 함수 추가
 */

package com.trycatch.owner.persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.memberMapper";
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	/**
	 * @author 김준혁
	 * trycatch에서 tryowner 웹서비스로 이동한 클라이언트의 정보를 불러오는 메서드
	 */
	@Override
	public MemberDTO getMember_no(int member_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMember_no", member_no);
		} catch (Exception err) {
			return null;
		}
	}
	/**
	 * @author LimDooHwi
	 * 점주의 수를 세는 함수
	 */
	@Override
	public int getMember_Count() {
		return sqlSession.selectOne(NAMESPACE+".getMember_Count");
	}
}
