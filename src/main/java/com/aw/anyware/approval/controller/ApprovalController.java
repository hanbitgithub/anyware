package com.aw.anyware.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	
	@RequestMapping("list.appro")
	public String listApproval() {
		return "approval/approvalListView";
	}

}
