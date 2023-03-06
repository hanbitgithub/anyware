package com.aw.anyware.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.aw.anyware.board.model.vo.Notice;
import com.aw.anyware.common.model.vo.PageInfo;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSession sqlSession, PageInfo pi) {
		return sqlSession.selectList("noticeMapper.selectList", pi);
	}

	
}
