package com.aw.anyware.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aw.anyware.member.model.service.MemberService;

@Controller
public class MemberController {
	
	
	
	@RequestMapping("regist.me")
	public String registNewMember() {
		return "member/registNewMember";
	}
	
	@RequestMapping("insert.me")
	public void insertMember() {
		
	}

}
