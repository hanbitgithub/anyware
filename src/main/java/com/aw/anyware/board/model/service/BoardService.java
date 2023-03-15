package com.aw.anyware.board.model.service;

import java.util.ArrayList;

import com.aw.anyware.board.model.vo.Board;
import com.aw.anyware.board.model.vo.Reply;
import com.aw.anyware.common.model.vo.PageInfo;

public interface BoardService {

	// 리스트 조회
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	ArrayList<Board> selectNoticeList(PageInfo pi);
	ArrayList<Board> selectGroupList(PageInfo pi);
	ArrayList<Board> selectMainBoardList();
	ArrayList<Board> selectMainNoticeList();
	
	// 작성하기
	int insertBoard(Board b);
	
	// 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 삭제
	int deleteBoard(int boardNo);
	
	// 수정하기
	int updateBoard(Board b);
	
	// 댓글리스트
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 댓글 작성
	int insertReply(Reply r);
	
	// 신고하기
	//int insertReport(Board b);
	
	

}
