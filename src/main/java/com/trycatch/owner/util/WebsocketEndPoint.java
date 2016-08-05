/*
 * 	Class: WebsocketEndPoint
 *  Description: Websocket연결을 담당하는 클래스 연결이 허용되고 진행되는 함수와 연결이 끝날때 진행되는 함수 메시지를 받았을 때 진행되는 함수로 구분 
 *  Created: 2016­07­25
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-25 by Try{}Catch
 *
 *	Revisions:
 * 	1. When & Who : 2016-07-27 by 임두휘
 * 	2. What		  : 1대1 채팅에 관련되어 구현 & httpsession에 저장된 member_no값을 가져와 websocket session에 저장. 세션이 닫힐 때 세션이 삭제 되게 구현
 * 
 *  1. When & Who : 2016-07-28 by 임두휘
 *  2. What		  : 메신져 DB와의 연결 메세지를 DB에 저장 시키고 해당하는 값들을 가져와 message에 입력하여 상대방 세션으로 전송. 만약 상대방이 session에 저장 되있지 않다면 저장만 진행. 
 *  				만약 상대방이 session에 저장되있지만 messenger connect 상태가 아니라면 connect값을 false로 보내서 전송 
 */
package com.trycatch.owner.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.trycatch.owner.domain.MessengerContentDTO;
import com.trycatch.owner.service.MessengerService;



@Controller
public class WebsocketEndPoint extends TextWebSocketHandler {
	@Inject
	private MessengerService service;
	
	private static List<WebSocketSession> sessions = new ArrayList<>();
	/**
	 * @author LimDooHwi
	 * 메세지를 받았을때 들어오는 함수. message를 DB에 저장시키고 해당 상대방 session을 찾아서 connect여부를 판단 값을 돌려준다.
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		TextMessage returnMessage = message;
		String stringMessage = message.getPayload();
		System.out.println(stringMessage);
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(stringMessage);
		if(obj.get("type").equals("orderalarm")){
			// 알람 기능
			for(int i=0; i<sessions.size();i++){
				Map<String, Object> map = sessions.get(i).getAttributes();
				String session_member_no = (String)map.get("member_no");
				if(session_member_no.equals(obj.get("member_no"))){
					sessions.get(i).sendMessage(returnMessage);
				}
			}
		}
		else if(obj.get("type").equals("messenger")){
			// 메신져 기능
			String member_no = String.valueOf(obj.get("send_member_no"));
			Map<String, Object> mymap = session.getAttributes();
			String my_member_no = (String)mymap.get("member_no");
			//DB저장 함수
			String messenger_content = String.valueOf(obj.get("message"));
			int messenger_no =service.getMessengerNo(Integer.parseInt(my_member_no), Integer.parseInt(member_no));
			service.insertMessege(messenger_no, messenger_content);
			
			System.out.println("세션 크기 : " + sessions.size());
			for(int i=0; i<sessions.size();i++){
				Map<String, Object> map = sessions.get(i).getAttributes();
				String session_member_no = (String)map.get("member_no");
				if(session_member_no.equals(member_no)){
					if(service.isConnect(service.getMessengerNo(Integer.parseInt(member_no),Integer.parseInt(my_member_no)))){
						obj.put("connect", "true");
					}
					else{
						obj.put("connect", "false");
					}
					MessengerContentDTO dto = service.getRecentContent();
					obj.put("messenger_no", dto.getMessenger_no());
					obj.put("member_name", dto.getMember_name());
					obj.put("content_regdate", dto.getContent_regdate());
					obj.put("content_read_ck", dto.getContent_read_ck());
					System.out.println(obj.toJSONString());
					returnMessage = new TextMessage(obj.toJSONString());
					sessions.get(i).sendMessage(returnMessage);
				}
			}
		}
		else if(obj.get("type").equals("NewContent")){
			for(int i=0; i<sessions.size();i++){
				sessions.get(i).sendMessage(returnMessage);
			}
		}
	}
	
	/**
	 * @author LimDooHwi
	 * websocket이 처음 connect 되었을때의 함수 session을 리스트에 저장한다. 
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId());
		sessions.add(session);
		super.afterConnectionEstablished(session);
	}
	/**
	 * @author LimDooHwi
	 * websocket연결이 끈겼을 경우 진행되는 함수 websocket이 끈겼을 경우 해당 멤버의 모든 messenger를 disconnect하고 session리스트에서 session을 삭제한다. 
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> mymap = session.getAttributes();
		String my_member_no = (String)mymap.get("member_no");
		if(my_member_no != null){
			List<Integer> messengerList = service.getMessengerNoList(Integer.parseInt(my_member_no));
			for(int i=0; i<messengerList.size(); i++){
				service.disconnect(messengerList.get(i));
			}
		}
		System.out.println("세션 닫힘:");
		System.out.println(status.getReason());
		sessions.remove(session);
		super.afterConnectionClosed(session, status);
	}
	
}