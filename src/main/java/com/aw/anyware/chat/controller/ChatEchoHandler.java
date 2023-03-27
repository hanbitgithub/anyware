package com.aw.anyware.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aw.anyware.chat.model.service.ChatService;
import com.aw.anyware.chat.model.vo.Thumbnail;


public class ChatEchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChatService cService;
	
	private ArrayList<WebSocketSession> RoomList = new ArrayList<>();
	
	// 웹소켓 세션 객체들을 저장해두는 리스트 = 로그인 한 사람들
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();
	
	// 해당 웹소켓에 새로운 클라이언트와 연결이 되었을 때 실행할 내용 정의
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/*
		System.out.println(session);
		System.out.println(session.getId());
		System.out.println(session.getAttributes());
		*/
		sessionList.add(session);
	}
	
	// 해당 웹소켓으로 데이터가 전달됐을 때 실행할 내용 정의
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String[] arr = ((String)message.getPayload()).split(",");
		String roomNo = arr[0];
		String writerNo = arr[1];
		String msg = arr[2];
		
		Thumbnail t = new Thumbnail();
		t.setRoomNo(Integer.parseInt(roomNo));
		t.setWriterNo(Integer.parseInt(writerNo));
		t.setContent(msg);
		
		int result = cService.insertChat(t); // result => insert된 채팅의 contentNo
		
		if(result > 0) {
			
			Thumbnail chat= cService.selectChatContent(result);
			System.out.println(chat);
			String sendmsg = chat.getContent() + "," + chat.getWriterNo() + "," + chat.getWriterName() + "," + chat.getDeptName() 
							+ "," + chat.getJobName() + "," + chat.getSendDate() + "," + chat.getSendTime();
					
			for(WebSocketSession sss : sessionList) {
				// 전달하고자 하는 메세지의 형식 => 메세지내용,발신자번호,발신자이름,발신자부서,발신자직급,보낸날짜,보낸시간
				sss.sendMessage(new TextMessage(sendmsg));
			}
		}
		
	}
	
	// 클라이언트와 연결이 끊겼을 때 실행할 내용 정의
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

}
