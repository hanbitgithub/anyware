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
	
	@RequestMapping("important.em")
	public String importantMailList() {
		return "mail/importantMailBox";
	}
	
	@RequestMapping("storage.em")
	public String temporaryMailList() {
		return "mail/temporaryStorageMailBox";
	}
	
	@RequestMapping("trash.em")
	public String trashMailList() {
		return "mail/trashMailBox";
	}
	
	
	
	@RequestMapping("detail.em")
	public String receiveMailDetail() {
		return "mail/receiveMailDetail";
	}
	
	@RequestMapping("sendForm.em")
	public String sendMailForm() {
		return "mail/sendMailForm";
		
	}
	
	@RequestMapping("sendToMe.em")
	public String sendMailToMe() {
		return "mail/sendMailToMe";
	}
	
	
	@RequestMapping("personal.ad")
	public String personalAddBookList() {
		return "mail/personalAddressbook";
	}
	
	@RequestMapping("company.ad")
	public String companyAddBookList() {
		return "mail/companyAddressbook";
	}
	
	
	@RequestMapping("test.do")
	public String test() {
		return "mail/test";
	}


}
