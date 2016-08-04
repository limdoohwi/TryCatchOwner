/*
 * 	Class: MeetingRoomDAOImpl
 *  Description: Meeting_Reservation Table과의 DB작업을 하기 위한 Repository
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MeetingRoomDTO;


@Repository
public class MeetingRoomDAOImpl implements MeetingRoomDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.meetingRoomMapper";
	private static final Logger logger = LoggerFactory.getLogger(MeetingRoomDAOImpl.class);
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 설정된 매장의 미팅룸 예약 리스트를 호출
	 */
	@Override
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMeetingResrevationLIst_withStore_no", store_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 설정된 매장의 오늘자 미팅룸 예약 리스트를 호출
	 */
	@Override
	public MeetingRoomDTO getMeetingResrevationLIstToday_withStore_no(int store_no, int time) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("time", time);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMeetingResrevationLIstToday_withStore_no", map);
		} catch (Exception err) {
			return null;
		}
	}
}