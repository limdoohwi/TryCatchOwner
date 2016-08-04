/*
 * 	Class: HandshakeInterceptor
 *  Description: Websocket연결중 http연결을 ws연결로 handshake 되는 부분을 담당하는 함수 
 *  Created: 2016­07­25
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-25 by Try{}Catch
 *
 *	Revisions:
 * 	1. When & Who : 2016-07-27 by 임두휘
 * 	2. What		  : httpsession에 저장된 member_no값을 가져와 websocket session에 저장
 */
package com.trycatch.owner.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.trycatch.owner.domain.MemberDTO;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	/**
	 * @author LimDooHwi
	 * HandShake가 시작되기전에 실행 되는 함수
	 * HttpServletRequest의 session에 저장된 member_no값을 Websocket session에 저장한다. 
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		System.out.println("Before Handshake");
		  
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
        MemberDTO member_dto = (MemberDTO)req.getSession().getAttribute("member_dto");
        attributes.put("member_no", String.valueOf(member_dto.getMember_no()));
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	/**
	 * @author LimDooHwi
	 * Handshake가 실행된 후에 진행되는 함수
	 */
	@Override
	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After Handshake");
		super.afterHandshake(request, response, wsHandler, ex);
	}
	
	

}
