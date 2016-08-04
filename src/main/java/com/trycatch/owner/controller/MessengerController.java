/*
 * 	Class: MessengerController
 *  Description: Messenger에 관련된 메서드를 관리하는 컨트롤러
 *  Created: 2016­07­20
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-20 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-25 by 임두휘
 * 		2. What		  : Messenger 화면 연결과 비연결에 대한 활성화 작업
 * 
 *      1. When & Who : 2016-07-27 by 임두휘
 *      2. What		  : 아직 읽지 않은 메세지를 띄워 주기위한 DB연결 추가 
 */
package com.trycatch.owner.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MessengerContentDTO;
import com.trycatch.owner.service.MessengerService;

import net.sf.json.JSONObject;

@Controller
public class MessengerController {
	@Inject
	private MessengerService service;
	
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect 1로 변경 시키거나 메신져가 없을 경우 새로 생성하는 ajax함수
	 * connect를 변경 시키면 해당 메신져에 있는 리스트를 가져와 뿌려준다. 
	 * 
	 */
	@RequestMapping("/messenger/connect")
	public @ResponseBody Object connect(int member_no, int send_member_no){
		if(service.isNew(member_no, send_member_no)){
			service.insertMessenger(member_no, send_member_no);
		}
		int messenger_no = service.getMessengerNo(member_no, send_member_no);
		service.connect(messenger_no);
		service.updateReadCk(member_no, send_member_no);
		JSONObject obj = new JSONObject();
		obj.put("contentList", service.getContentList(member_no, send_member_no));
		return obj;
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 메신져의 connect상태를 0으로 변경해 주는 함수 
	 * 
	 */
	@RequestMapping("/messenger/disconnect")
	public @ResponseBody void disconnect(int member_no, int send_member_no){
		int messenger_no = service.getMessengerNo(member_no, send_member_no);
		service.disconnect(messenger_no);
	}
	/**
	 * 
	 * @author LimDooHwi
	 * 아직 읽지 않은 메시지를 가져와 뿌려주기위한 Controller 
	 * 
	 */
	@RequestMapping("/messenger/noreadmsglist")
	public @ResponseBody Object noReadMsgList(int member_no){
		JSONObject obj = new JSONObject();
		obj.put("noReadMsgList",service.getNotReadContentList(member_no));
		return obj;
	}
	
	
}
