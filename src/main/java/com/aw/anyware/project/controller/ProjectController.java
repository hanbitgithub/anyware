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
	public String selectProjectList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
									String category, String condition, String keyword, Model model, 
									HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = pService.selectListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		map.put("memberNo", memberNo);
		
		ArrayList<Project> list = pService.selectProjectList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "project/projectListView";
	}
	
	@RequestMapping("insert.pj")
	public String insertProject(Project pj, int memberNo, Model model) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pj", pj);
		map.put("memberNo", memberNo);
		
		int result = pService.insertProject(map);
		
		if(result == 0) {
			model.addAttribute("alertMsg", "프로젝트 생성에 실패했습니다.");
		}
		
		return "redirect:detail.pj?no=" + result; // 상세페이지로 이동
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
	
	@RequestMapping("detail.pj")
	public String projectDetailView(int no) {
		return "project/projectDetailView";
	}
	
	@RequestMapping("detail.li")
	public String listDetailView() {
		return "project/listDetailView";
	}

}
