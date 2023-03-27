package com.aw.anyware.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aw.anyware.chat.model.vo.ChatContent;
import com.aw.anyware.chat.model.vo.Thumbnail;

public interface ChatService {
	
	// 채팅방리스트 조회(select)
	ArrayList<Thumbnail> selectChatRoomList(int memberNo);
	
	// 안읽은숫자 update
	int updateCount(HashMap<String, Integer> map);
	
	// 채팅내용 리스트 조회(select)
	ArrayList<ChatContent> selectChatContentList(int roomNo);
	
	// 채팅 추가 서비스(insert)
	int insertChat(Thumbnail t);
	
	// 채팅 내용 조회 서비스(select)
	Thumbnail selectChatContent(int contentNo);

}
