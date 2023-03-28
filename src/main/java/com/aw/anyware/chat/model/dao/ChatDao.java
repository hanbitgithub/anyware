package com.aw.anyware.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.chat.model.vo.ChatContent;
import com.aw.anyware.chat.model.vo.ChatMember;
import com.aw.anyware.chat.model.vo.Thumbnail;

@Repository
public class ChatDao {

	public ArrayList<Thumbnail> selectChatRoomList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatRoomList", memberNo);
	}
	
	public int updateCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("chatMapper.updateCount", map);
	}

	public ArrayList<ChatContent> selectChatContentList(SqlSessionTemplate sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatContentList", roomNo);
	}

	public int insertChat(SqlSessionTemplate sqlSession, Thumbnail t) {
		sqlSession.insert("chatMapper.insertChat", t);
		int contentNo = t.getContentNo();
		
		return contentNo;
	}

	public Thumbnail selectChatContent(SqlSessionTemplate sqlSession, int contentNo) {
		return sqlSession.selectOne("chatMapper.selectChatContent", contentNo);
	}

	public ArrayList<ChatMember> selectRoomNum(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectRoomNum", memberNo);
	}

	public int increaseNotRead(SqlSessionTemplate sqlSession, String roomNo) {
		return sqlSession.update("chatMapper.increaseNotRead", roomNo);
	}


}
