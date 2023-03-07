package com.aw.anyware.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aw.anyware.approval.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("list.appro")
	public String listApproval() {
		return "approval/approvalListView";
	}
	
	@RequestMapping("enroll.appro")
	public String enrollAppro() {
		return "approval/approvalEnrollForm";
	}
	
	@RequestMapping("test.appro")
	public String test() {
		
		aService.selectListCount();
		return "approval/approvalEnrollForm";
	}

}
