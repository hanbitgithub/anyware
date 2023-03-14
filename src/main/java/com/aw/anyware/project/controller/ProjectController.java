package com.aw.anyware.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.service.ProjectService;
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
	
	@RequestMapping("detail.pj")
	public String projectDetailView() {
		return "project/projectDetailView";
	}
	
	@RequestMapping("detail.li")
	public String listDetailView() {
		return "project/listDetailView";
	}

}
