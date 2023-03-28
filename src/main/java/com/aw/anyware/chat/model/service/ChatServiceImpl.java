package com.aw.anyware.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.chat.model.dao.ChatDao;
import com.aw.anyware.chat.model.vo.ChatContent;
import com.aw.anyware.chat.model.vo.ChatMember;
import com.aw.anyware.chat.model.vo.Thumbnail;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Thumbnail> selectChatRoomList(int memberNo) {
		return cDao.selectChatRoomList(sqlSession, memberNo);
	}

	@Override
	public int updateCount(HashMap<String, Integer> map) {
		return cDao.updateCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<ChatContent> selectChatContentList(int roomNo) {
		return cDao.selectChatContentList(sqlSession, roomNo);
	}

	@Override
	public int insertChat(Thumbnail t) {
		return cDao.insertChat(sqlSession, t);
	}

	@Override
	public Thumbnail selectChatContent(int contentNo) {
		return cDao.selectChatContent(sqlSession, contentNo);
	}

	@Override
	public ArrayList<ChatMember> selectRoomNum(int memberNo) {
		return cDao.selectRoomNum(sqlSession, memberNo);
	}

	@Override
	public int increaseNotRead(Thumbnail t) {
		return cDao.increaseNotRead(sqlSession, t);
	}

	@Override
	public String selectPrevDate(String roomNo) {
		return cDao.selectPrevDate(sqlSession, roomNo);
	}

	@Override
	public HashMap<String, Object> insertRoom(int writerNo, int otherNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("writerNo", writerNo);
		map.put("otherNo", otherNo);

		// 기존 방이 있는지 확인
		String roomNo = cDao.selectRoomNo(sqlSession, map);
		
		if(roomNo != null) { // 기존 방 있을 경우 => 채팅내용 조회
			ArrayList<ChatContent> chList = cDao.selectChatContentList(sqlSession, Integer.parseInt(roomNo));
			map.put("roomNo", roomNo);
			map.put("chList", chList);
		} else { // 채팅방 & 멤버 insert
			int result = cDao.insertRoom(sqlSession, map); // roomNo
			
			if(result > 0) {
				map.put("roomNo", result);
				
				// member insert
				map.put("condition", "my");
				int result2 = cDao.insertChatMember(sqlSession, map);
				map.put("condition", "other");
				int result3 = cDao.insertChatMember(sqlSession, map);
				
				map.put("chList", "");
			}
		}
		
		return map;
	}

}
