package com.aw.anyware.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.board.model.dao.BoardDao;
import com.aw.anyware.board.model.vo.Board;
import com.aw.anyware.board.model.vo.Reply;
import com.aw.anyware.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return bDao.selectNoticeList(sqlSession, pi);
	}
	
	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return bDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return bDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectGroupList(PageInfo pi) {
		return bDao.selectGroupList(sqlSession, pi);
	}

	@Override
	public ArrayList<Board> selectMainBoardList() {
		return bDao.selectMainBoardList(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectMainNoticeList() {
		return bDao.selectMainNoticeList(sqlSession);
	}
	/*
	@Override
	public int insertReport(Board b) {
		return bDao.insertReport(sqlSession, b);
	}
	*/



}
