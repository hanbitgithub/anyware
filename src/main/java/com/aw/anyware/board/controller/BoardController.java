package com.aw.anyware.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.vo.Like;
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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/boardListView";
		
	}
	

	
	@RequestMapping("nlist.bo")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/noticeListView";
		
	}
	
	@RequestMapping("glist.bo")
	public String selectGroupList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, HttpServletRequest request) {
		
		String deptName = ((Member)request.getSession().getAttribute("loginUser")).getDeptName();
		
		
		int listCount = bService.selectGListCount(deptName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectGroupList(pi, deptName);
		
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println();
		

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
	
	/**
	 * 게시글 수정
	 * @param b
	 * @param reupfile
	 * @param session
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 댓글목록조회
	 * @param no
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="aplication/json; charset=utf-8")
	public String ajaxSelectReplyList(int no) {
		
		ArrayList<Reply> list = bService.selectReplyList(no);
		return new Gson().toJson(list);
	}
	
	/**
	 * 댓글 작성하기
	 * @param r
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result = bService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 댓글 수정하기
	 * @param r
	 * @param b
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("update.re")
	public String updateReply(int no, String content, HttpSession session, Model model) {
		
		
		Reply r = new Reply();
		r.setReplyNo(no);
		r.setReplyContent(content);
		System.out.println(no);
		
		int result = bService.updateReply(r);
		
		
		/*
		if(result > 0) {
			session.setAttribute("alertMsg", "댓글 수정이 완료되었습니다.");
			return "redirect:detail.bo?no=" + b.getBoardNo();
		}else {
			model.addAttribute("errorMsg", "댓글 수정 실패");
			return "common/errorPage";
		}
		*/
		return new Gson().toJson(result);
	}
	/**
	 * 댓글 삭제하기
	 * @param no
	 * @param filePath
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete.re")
	public String deleteReply(int no, Board b, HttpSession session, Model model) {
		
		int result = bService.deleteReply(no);
		int result1 = bService.updateBoard(b);
		
		/*
		if(result > 0) {
			
			session.setAttribute("alertMsg", "댓글 삭제가 완료되었습니다.");
			return "redirect:detail.bo?no=" + b.getBoardNo();
			
		}else {
			model.addAttribute("errorMsg", "댓글 삭제 실패");
			return "common/errorPage";
			
		}*/
		return new Gson().toJson(result);
	}
	
	/**
	 * 메인화면
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value="mainPage.bo", produces="application/json; charset=utf-8")
	public String selectMainList() {
		ArrayList<Board> list = bService.selectMainList();
		return new Gson().toJson(list);
	}
	
	/**
	 * 메인화면 - 자유게시판
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="mainList.bo", produces="application/json; charset=utf-8")
	public String selectMainBoardList() {
		ArrayList<Board> list = bService.selectMainBoardList();
		return new Gson().toJson(list);
	}
	
	
	/**
	 * 메인화면 - 공지사항
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="mainList.no", produces="application/json; charset=utf-8")
	public String selectMainNoticeList() {
		ArrayList<Board> list = bService.selectMainNoticeList();
		return new Gson().toJson(list);
	}
	
	/**
	 * 신고하기
	 * @param b
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insert.rp")
	public String insertReport(Board b, HttpSession session, Model model) {


		int result = bService.insertReport(b);
		
		if(result > 0) { 
			return "redirect:detail.bo?no=" + b.getPostNo();
		}else {
			model.addAttribute("errorMsg", "신고접수 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 신고게시글조회
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("list.rp")
	public String selectReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectRListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectReportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/report";
		
	}
	
	/**
	 * 신고게시글 처리
	 * @param no
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.rp")
	public String deleteReport(int no, int bno, HttpSession session, Model model) {
		
		int result = bService.deleteReport(no);
		int result1 = bService.deleteBoard(bno);
		
		if(result > 0 && result1 > 0) {
			
			session.setAttribute("alertMsg", "게시글이 블라인드처리 되었습니다.");
			return "redirect:list.rp";
			
		}else {
			model.addAttribute("errorMsg", "게시글 블라인드 실패");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("search.bo")
	public String searchBoardList(String keyword, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int searchCount = bService.selectSearchCount(keyword);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		
		ArrayList<Board> list = bService.searchBoardList(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("keyword", keyword);
		
		
		return "board/boardListView";
	}
	
	@RequestMapping("search.no")
	public String searchNoticeList(String keyword, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int searchCount = bService.selectSearchCount(keyword);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		
		ArrayList<Board> list = bService.searchNoticeList(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("keyword", keyword);
		
		
		return "board/noticeListView";
	}
	
	@RequestMapping("search.gr")
	public String searchGroupList(String keyword, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int searchCount = bService.selectSearchCount(keyword);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		
		ArrayList<Board> list = bService.searchGroupList(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("keyword", keyword);
		
		return "board/groupListView";
	}
	
	@RequestMapping("likelist.bo")
	public String selectLikeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectLikeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		

		return "board/likeListView";
		
	}

	@ResponseBody
	@RequestMapping(value="like.bo")
	public String likeBoard(Board b, HttpSession session, Model model) {

		b.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = bService.likeBoard(b);
		
		return result > 0 ? "success" : "fail";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="unlike.bo")
	public String deleteLikeBoard(Board b, HttpSession session) {
		b.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = bService.deleteLikeBoard(b);
		
		return result > 0 ? "success" : "fail";
	}
	
	


	

	
}
