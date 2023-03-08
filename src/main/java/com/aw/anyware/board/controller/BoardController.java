package com.aw.anyware.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aw.anyware.board.model.service.BoardService;
import com.aw.anyware.board.model.vo.Board;
import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/boardListView";
		
	}
}
