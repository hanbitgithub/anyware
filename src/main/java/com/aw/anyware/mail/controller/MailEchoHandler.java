package com.aw.anyware.mail.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aw.anyware.common.model.service.AlarmService;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.vo.List;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller 
public class MailEchoHandler extends TextWebSocketHandler {
	
	
	 @Autowired 
	 private AlarmService aService;
	
	 private final ObjectMapper objectMapper = new ObjectMapper();
	
	 	//로그인 한 전체 session 리스트
	private ArrayList<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		// 현재 로그인 중인 개별 유저
	private	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
		

		// 해당 websocket에 새로운 클라이언트와 연결이 되었을때 실행할 내용 정의 
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			// WebSocketSession 객체 : 현재 해당 웹소켓과 연결된 클라이언트 측 객체(즉, 채팅방에 접속한 사용자)
	
			 String senderId = ((Member)session.getAttributes().get("loginUser")).getMemberId(); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
				if(senderId!=null) {	// 로그인 값이 있는 경우만
				//	System.out.println(senderId + " 연결 됨");
					users.put(senderId, session);   // 로그인중 개별유저 저장
				}
			
			
		}
		
		
		// 클라이언트 측으로부터 해당 웹소켓으로 데이터가 전달되었을 때 실행할 내용 정의 
		@Override
		public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
			// WebSocketSession : 현재 해당 웹소켓으로 메세지를 전송한 클라이언트 측 객체
			// WebSocketMessage : 현재 전달된 메세지에 대한 정보를 가지고 있는 객체

			String senderId = ((Member)session.getAttributes().get("loginUser")).getMemberId();

			// 특정 유저에게 보낼 메시지 내용 추출
			String msg = (String) message.getPayload();
			if(msg != null) {
				String[] strs = msg.split(",");
				System.out.println(strs.toString());
				if(strs != null && strs.length == 4) {
					String type = strs[0];
					String target = strs[1]; // m_id 저장
					String content = strs[2];
					String url = strs[3];
					WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
					
					// 실시간 접속시
					if(targetSession!=null) {
						TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
						targetSession.sendMessage(tmpMsg);
					}
				}
			}
			
			
			
			
			
		}
		
		// 클라이언트와 웹소켓간의 연결이 끊겼을때 실행할 내용 정의 
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			String senderId = ((Member)session.getAttributes().get("loginUser")).getMemberId();
			if(senderId!=null) {	// 로그인 값이 있는 경우만
			//	System.out.println(senderId + " 연결 종료됨");
				users.remove(senderId);
				sessions.remove(session);
			}
		}
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
