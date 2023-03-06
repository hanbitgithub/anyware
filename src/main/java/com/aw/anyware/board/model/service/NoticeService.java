package com.aw.anyware.board.model.service;

import java.util.ArrayList;

import com.aw.anyware.board.model.vo.Notice;
import com.aw.anyware.common.model.vo.PageInfo;

public interface NoticeService {

	// 리스트
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi); 
	
	// 작성하기
	int insertNotice(Notice n);
	
	// 상세조회
	int increaseCount(int NoticeNo);
	Notice selectNotice(int NoticeNo);
	
	// 삭제
	int deleteNotice(int NoticeNo);
	
	// 수정
	int updateNotice(Notice n);
	
}
