package com.aw.anyware.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aw.anyware.chat.model.service.ChatService;
import com.aw.anyware.chat.model.vo.ChatMember;
import com.aw.anyware.chat.model.vo.Thumbnail;
import com.aw.anyware.member.model.vo.Member;


public class ChatEchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChatService cService;
	
	// 접속한 유저가 가진 모든 채팅방 정보를 저장해두는 리스트
	private HashMap<ChatMember, WebSocketSession> roomList = new HashMap<>();
	
	// 웹소켓 세션 객체들을 저장해두는 리스트 = 로그인 한 사람들
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();
	
	// 해당 웹소켓에 새로운 클라이언트와 연결이 되었을 때 실행할 내용 정의
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// System.out.println(session);
		// System.out.println(session.getId());
		// System.out.println(((Member)session.getAttributes()).getMemberNo());
		
		sessionList.add(session);
		
		int memberNo = ((Member)session.getAttributes().get("loginUser")).getMemberNo();
		ArrayList<ChatMember> r = cService.selectRoomNum(memberNo);
		
		for(ChatMember rl : r) {
			roomList.put(rl, session);
		}
		
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
		
		int result1 = cService.insertChat(t); // result => insert된 채팅의 contentNo
		int result2 = cService.increaseNotRead(t); // insert 후 안읽은 채팅 수 +1
		
		if(result1 > 0 && result2 > 0) {
			Thumbnail chat= cService.selectChatContent(result1);
			
			String sendmsg = chat.getContent() + "," + chat.getWriterNo() + "," + chat.getWriterName() + "," + chat.getDeptName() 
							+ "," + chat.getJobName() + "," + chat.getSendDate() + "," + chat.getSendTime();
			
			Iterator it = roomList.entrySet().iterator();
		    while(it.hasNext()) {
		        Map.Entry<ChatMember, WebSocketSession> entry = (Map.Entry)it.next();
		        if(entry.getKey().getRoomNo() == Integer.parseInt(roomNo)) {
		        	entry.getValue().sendMessage(new TextMessage(sendmsg));
		        }
		    }
		    
		}
		
	}
	
	// 클라이언트와 연결이 끊겼을 때 실행할 내용 정의
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		
		Iterator it = roomList.entrySet().iterator();
		while(it.hasNext()) {
	        Map.Entry<ChatMember, WebSocketSession> entry = (Map.Entry)it.next();
	        if(entry.getValue() == session) {
	        	it.remove();
	        }
	    }
	}

}
