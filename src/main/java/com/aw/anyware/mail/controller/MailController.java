package com.aw.anyware.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	@RequestMapping("receivebox.em")
	public String receiveMailList() {
		return "mail/receiveMailBox";
	}
	@RequestMapping("sendbox.em")
	public String sendMailList() {
		return "mail/sendMailBox";
	}
	
	
	@RequestMapping("detail.em")
	public String receiveMailDetail() {
		return "mail/receiveMailDetail";
	}
	
	@RequestMapping("sendForm.em")
	public String sendMailForm() {
		return "mail/sendMailForm";
		
	}
	
	@RequestMapping("personal.ad")
	public String personalAddBookList() {
		return "mail/personalAddressbook";
	}
	
	
	@RequestMapping("test.do")
	public String test() {
		return "mail/successSendmail";
	}


}
