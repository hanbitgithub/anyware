package com.aw.anyware.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("personal.ch")
	public String personalChat() {
		return "chat/personalChat";
	}

}
