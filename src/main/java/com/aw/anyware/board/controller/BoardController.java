package com.aw.anyware.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aw.anyware.board.model.service.BoardService;
import com.aw.anyware.board.model.vo.Board;
import com.aw.anyware.board.model.vo.Reply;
import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.FileUpload;
import com.aw.anyware.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("main.bo")
	public String mainpage() {
		return "board/boardMain";
	}
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/boardListView";
		
	}
	

	
	@RequestMapping("nlist.bo")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/noticeListView";
		
	}
	
	@RequestMapping("glist.bo")
	public String selectGroupList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectGroupList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/groupListView";
		
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {

		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName(saveFilePath);
		}
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "board/boardMain";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int no, ModelAndView mv) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			Board b = bService.selectBoard(no);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int no, String filePath, HttpSession session, Model model) {
		
		int result = bService.deleteBoard(no);
		
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.bo";
			
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int no, Model model) {
		model.addAttribute("b", bService.selectBoard(no));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
			
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName(saveFilePath);
			
		}

		int result = bService.updateBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detail.bo?no=" + b.getBoardNo();
		}else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no) {
		
		ArrayList<Reply> list = bService.selectReplyList(no);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result = bService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	@ResponseBody
	@RequestMapping(value="mainList.bo", produces="application/json; charset=utf-8")
	public String selectMainBoardList() {
		ArrayList<Board> list = bService.selectMainBoardList();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="mainList.no", produces="application/json; charset=utf-8")
	public String selectMainNoticeList() {
		ArrayList<Board> list2 = bService.selectMainNoticeList();
		return new Gson().toJson(list2);
	}
	
	@RequestMapping("rlist.bo")
	public String reportPage() {
		return "board/report";
	}
	/*
	@RequestMapping("insert.rp")
	public String insertReport(Board b, HttpSession session, Model model) {


		int result = bService.insertReport(b);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "board/boardMain";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	*/
}
