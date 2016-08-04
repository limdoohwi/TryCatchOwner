/*
 * 	Class: StoreDAOImpl
 *  Description: Store Table과 DB작업을 하기 위한 Repository
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.StoreDTO;

@Repository
public class StoreDAOImpl implements StoreDAO {
	private static final Logger logger = LoggerFactory.getLogger(StoreDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.storeMapper";
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 설정된 매장이 보유하고 있는 미팅룸 리스트를 호출
	 */
	@Override
	public int getStore_meeting_room(int store_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getStore_meeting_room", store_no);
		} catch (Exception err) {
			return 1;
		}
	}
	 
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 접속한 클라이언트의 보유 매장 리스트를 호출
	 */
	@Override
	public List<StoreDTO> getStoreList_member_no(int member_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getStoreList_member_no", member_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * 매장 번호를 통해 매장 정보를 호출
	 */
	@Override
	public StoreDTO getStore_store_no(int store_no) {
		try {
			return sqlSession.selectOne("getStore_store_no", store_no);
		} catch (Exception err) {
			return null;
		}
	}
}
