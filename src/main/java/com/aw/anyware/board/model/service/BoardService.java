package com.aw.anyware.board.model.service;

import java.util.ArrayList;

import com.aw.anyware.board.model.vo.Board;
import com.aw.anyware.common.model.vo.PageInfo;

public interface BoardService {

	// 리스트
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi); 
	

	
}
