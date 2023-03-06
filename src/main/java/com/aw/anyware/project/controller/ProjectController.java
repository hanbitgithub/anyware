package com.aw.anyware.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("list.pj")
	public String projectListView() {
		return "project/projectListView";
	}
	
	@RequestMapping("detail.pj")
	public String projectDetailView() {
		return "project/projectDetailView";
	}

}
