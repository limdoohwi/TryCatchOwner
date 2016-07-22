package com.trycatch.owner.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Singleton;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * Tomcat7의 webSocket 테스트
 * <P>
 * 이 모듈을 사용할 경우 Singleton으로 동작하지 않는다. sessions가 각 호출 시 마다 생성되므로 static으로 정해 줘야
 * 한다.<br>
 * 브라우져가 websocket을 지원 해야 한다.<br>
 * 웹 소켓 연결 후 별도 close 동작 없이 브라우져를 닫을 경우 자동으로 OnClose가 호출 된다.
 * 
 * @author KimSH
 * @see https://blog.idrsolutions.com/2013/12/websockets-an-introduction/
 */
@ServerEndpoint(value = "/abc")
@Controller
@Singleton
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	private static final java.util.Set<Session> sessions = java.util.Collections
			.synchronizedSet(new java.util.HashSet<Session>());

	/**
	 * @OnOpen allows us to intercept the creation of a new session. The session
	 *         class allows us to send data to the user. In the method onOpen,
	 *         we'll let the user know that the handshake was successful.
	 */
	@OnOpen
	public void onOpen(Session session) {
		logger.info("테스트 웹 소켓  세션 아이디 : " + session.getId());
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("Connection Established");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		sessions.add(session);
	}

	/**
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param self
	 * @param message
	 */
	private void sendAllSessionToMessage(Session self, String message) {
		logger.info("센드올메세지 진입 : " + message);
		try {
			for (Session session : TestController.sessions) {
				if (!self.getId().equals(session.getId()))
					session.getBasicRemote().sendText("All : " + message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * When a user sends a message to the server, this method will intercept the
	 * message and allow us to react to it. For now the message is read as a
	 * String.
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("온 메세지 진입 : " + message);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("to : " + message);
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		sendAllSessionToMessage(session, message);
	}

	@OnError
	public void onError(Throwable e, Session session) {
		logger.info("온에러 진입 : " + e);
	}

	/**
	 * The user closes the connection.
	 * 
	 * Note: you can't send messages to the client from this method
	 */
	@OnClose
	public void onClose(Session session) {
		logger.info("온 클로즈 진입 : " + session.getId());
		sessions.remove(session);
	}
}
