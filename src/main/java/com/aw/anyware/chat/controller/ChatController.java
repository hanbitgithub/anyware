package com.aw.anyware.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aw.anyware.chat.model.service.ChatService;
import com.aw.anyware.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("personal.ch")
	public String personalChat() {
		return "chat/personalChat";
	}
	
	@RequestMapping("participants.pj")
	public String participantsManage() {
		ArrayList<Member> dlist = cService.selectDept();
		return "project/participantsManageView";
	}

}
