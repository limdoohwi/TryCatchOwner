/*
 * 	Class: MessengerDAOImpl
 *  Description: MessengerDAO 를 상속 받는 클래스로서 DB에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­07­21
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-24 by 임두휘
 * 		2. What		  : Content를 입력 검색하는 DB 추가
 * 
 */
package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MessengerContentDTO;

@Repository
public class MessengerDAOImpl implements MessengerDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.messengerMapper";
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져가 존재하는지 아닌지를 알려주는 함수
	 * 
	 */
	@Override
	public boolean isNew(int member_no, int send_member_no) {
		Map<String, Integer> map= new HashMap<>();
		map.put("member_no", member_no);
		map.put("send_member_no", send_member_no);
		int check = sqlSession.selectOne(NAMESPACE+".isNew",map);
		if(check==0){
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 새로운 메신져를 생성하는 함수
	 * 
	 */
	@Override
	public void insertMessenger(int member_no, int send_member_no) {
		Map<String, Integer> map= new HashMap<>();
		map.put("member_no", member_no);
		map.put("send_member_no", send_member_no);
		sqlSession.insert(NAMESPACE+".insertMessenger", map);

	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect 1로 변경 시키는 함수
	 * 
	 */
	@Override
	public void connect(int messenger_no) {
		sqlSession.update(NAMESPACE+".connect", messenger_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect 0로 변경 시키는 함수 
	 * 
	 */
	@Override
	public void disconnect(int messenger_no) {
		sqlSession.update(NAMESPACE+".disconnect", messenger_no);

	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져 번호를 받아오는 함수
	 * 
	 */
	@Override
	public int getMessengerNo(int member_no, int send_member_no) {
		Map<String, Integer> map= new HashMap<>();
		map.put("member_no", member_no);
		map.put("send_member_no", send_member_no);
		return sqlSession.selectOne(NAMESPACE+".getMessengerNo", map);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 해당 멤버가 가지고 있는 모든 메신져 번호를 가져오는 함수
	 */
	@Override
	public List<Integer> getMessengerNoList(int member_no) {
		return sqlSession.selectList(NAMESPACE+".getMessengerNoList", member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져에 메시지를 DB에 입력하는 함수
	 * 
	 */
	@Override
	public void insertMessege(int messenger_no, String messenger_content) {
		Map<String, Object> map= new HashMap<>();
		map.put("messenger_no", messenger_no);
		map.put("messenger_content", messenger_content);
		sqlSession.insert(NAMESPACE+".insertMessege", map);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 해당 메신져의 모든 메시지를 가져오는 함수
	 * 
	 */
	@Override
	public List<MessengerContentDTO> getContentList(int member_no, int send_member_no) {
		int messenger_no = getMessengerNo(member_no,send_member_no);
		int send_messenger_no = 0;
		try{
			send_messenger_no = getMessengerNo(send_member_no,member_no);
		}
		catch(Exception err){}
		System.out.println(messenger_no + ": " + member_no + ", " + send_member_no);
		System.out.println(send_messenger_no + ": " + send_member_no + ", " + member_no);
		Map<String, Integer> map = new HashMap<>();
		map.put("messenger_no", messenger_no);
		map.put("send_messenger_no", send_messenger_no);
		return sqlSession.selectList(NAMESPACE+".getContentList", map);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 현재 메신져의 connect가 연결되어있는지를 확인 하는 함수
	 * 
	 */
	@Override
	public boolean isConnect(int messenger_no) {
		int connect=sqlSession.selectOne(NAMESPACE+".isConnect", messenger_no);
		if(connect ==0){
			return false;
		}else{
			return true;
		}
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져가 켜질때 멤버가 읽지 않은 상대방의 read값을 읽음 상태로 변경 하는 함수
	 * 
	 */
	@Override
	public void updateReadCK(int member_no, int send_member_no) {
		Map<String, Integer> map= new HashMap<>();
		map.put("member_no", member_no);
		map.put("send_member_no", send_member_no);
		System.out.println(member_no+","+ send_member_no);
		sqlSession.update(NAMESPACE+".updateReadCk", map);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 아직 읽지 않은 메시지의 리스트를 가져오는 함수 
	 * 
	 */
	@Override
	public List<MessengerContentDTO> getNotReadContentList(int member_no) {
		return sqlSession.selectList(NAMESPACE+".getNotReadContentList",member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 가장 최근에 입력된 메시지를 가져오는 함수 
	 * 
	 */
	@Override
	public MessengerContentDTO getRecentContent() {
		return sqlSession.selectOne(NAMESPACE+".getRecentContent");
	}

}
