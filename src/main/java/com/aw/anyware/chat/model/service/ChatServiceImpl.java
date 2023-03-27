package com.aw.anyware.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.chat.model.dao.ChatDao;
import com.aw.anyware.chat.model.vo.ChatContent;
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

	

}
