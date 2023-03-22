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
	int insertReport(Board b);
	
	// 신고조회
	int selectRListCount();
	ArrayList<Board> selectReportList(PageInfo pi);
	
	int deleteReport(int reportNo);
	
	// 댓글수정
	int updateReply(Reply r);
	
	// 댓글삭제
	int deleteReply(int replyNo);
	
	// 검색
	int selectSearchCount(String keyword);
	ArrayList<Board> searchBoardList(PageInfo pi, String keyword);
	ArrayList<Board> searchNoticeList(PageInfo pi, String keyword);
	ArrayList<Board> searchGroupList(PageInfo pi, String keyword);
	
	

}
