package com.aw.anyware.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.service.ProjectService;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pj")
	public String projectListView(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, HttpServletRequest request) {
		
		int listCount = pService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		ArrayList<Project> list = pService.selectProjectList(memberNo, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "project/projectListView";
	}
	
	@RequestMapping("insert.pj")
	public String insertProject(Project pj, Model model) {
		
		int result = pService.insertProject(pj);
		
		if(result == 0) {
			model.addAttribute("alertMsg", "프로젝트 생성에 실패했습니다.");
		}
		
		return "redirect:list.pj";
	}
	
	@RequestMapping("search.pj")
	public String searchProject(String condition, String keyword, @RequestParam(value="cpage", defaultValue="1")int currentPage, 
								HttpServletRequest request, Model model) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("memberNo", ((Member)request.getSession().getAttribute("loginUser")).getMemberNo());
		
		int listCount = pService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		map.put("pi", pi);
		
		ArrayList<Project> list = pService.searchProject(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "project/projectListView";
	}
	
	@ResponseBody
	@RequestMapping(value="insertLike.ajax")
	public String insertLike(Like like, HttpSession session) {
		like.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = pService.insertLike(like);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteLike.ajax")
	public String deleteLike(Like like, HttpSession session) {
		like.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = pService.deleteLike(like);
		
		return result > 0 ? "success" : "fail";
	}
	
	@RequestMapping("mylist.pj")
	public String myProjectListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpServletRequest request, Model model ) {
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		int listCount = pService.selectMyListCount(memberNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Project> list = pService.selectMyProjectList(memberNo, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "project/myProjectListView";
	}
	
	@RequestMapping("detail.pj")
	public String projectDetailView() {
		return "project/projectDetailView";
	}
	
	@RequestMapping("detail.li")
	public String listDetailView() {
		return "project/listDetailView";
	}

}
