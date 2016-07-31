/*
 * 	Class: MessengerServiceImpl
 *  Description: MessengerService 를 상속 받는 클래스로서 MessengerDAO에 직접적인 연결을 담당하는 클래스
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
package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MessengerContentDTO;
import com.trycatch.owner.persistence.MessengerDAO;

@Service
public class MessengerServiceImpl implements MessengerService {
	@Inject
	private MessengerDAO dao;
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져가 존재하는지 아닌지를 알려주는 함수
	 * 
	 */
	@Override
	public boolean isNew(int member_no, int send_member_no) {
		return dao.isNew(member_no, send_member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 새로운 메신져를 생성하는 함수
	 * 
	 */
	@Override
	public void insertMessenger(int member_no, int send_member_no) {
		dao.insertMessenger(member_no, send_member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect 1로 변경 시키는 함수
	 * 
	 */
	@Override
	public void connect(int messenger_no) {
		dao.connect(messenger_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect 0로 변경 시키는 함수 
	 * 
	 */
	@Override
	public void disconnect(int messenger_no) {
		dao.disconnect(messenger_no);

	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져 번호를 받아오는 함수
	 * 
	 */
	@Override
	public int getMessengerNo(int member_no, int send_member_no) {
		return dao.getMessengerNo(member_no, send_member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 해당 멤버가 가지고 있는 모든 메신져 번호를 가져오는 함수
	 */
	@Override
	public List<Integer> getMessengerNoList(int member_no) {
		return dao.getMessengerNoList(member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져에 메시지를 DB에 입력하는 함수
	 * 
	 */
	@Override
	public void insertMessege(int messenger_no, String messenger_content) {
		dao.insertMessege(messenger_no, messenger_content);

	}
	/**
	 * 
	 * @author LimDooHwi
	 * 해당 메신져의 모든 메시지를 가져오는 함수
	 * 
	 */
	@Override
	public List<MessengerContentDTO> getContentList(int member_no, int send_member_no) {
		return dao.getContentList(member_no, send_member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 현재 메신져의 connect가 연결되어있는지를 확인 하는 함수
	 * 
	 */
	@Override
	public boolean isConnect(int messenger_no) {
		return dao.isConnect(messenger_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져가 켜질때 멤버가 읽지 않은 상대방의 read값을 읽음 상태로 변경 하는 함수
	 * 
	 */
	@Override
	public void updateReadCk(int member_no, int send_member_no) {
		dao.updateReadCK(member_no, send_member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 아직 읽지 않은 메시지의 리스트를 가져오는 함수 
	 * 
	 */
	@Override
	public List<MessengerContentDTO> getNotReadContentList(int member_no) {
		return dao.getNotReadContentList(member_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 가장 최근에 입력된 메시지를 가져오는 함수 
	 * 
	 */
	@Override
	public MessengerContentDTO getRecentContent() {
		return dao.getRecentContent();
	}
}
