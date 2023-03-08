package com.aw.anyware.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.mail.model.service.MailService;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
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
	
	
	
	// 주소록
	@RequestMapping("personal.ad")
	public String personalAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage, Model model) {
		// 주소록 갯수 조회
		int listCount = mService.selectAddressListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		// 주소록 리스트 조회
		ArrayList<AddressBook> list = mService.selectAddbookList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
	
		
		return "mail/personalAddressbook";
	}
	
	// 주소록 그룹리스트 조회 
	@ResponseBody
	@RequestMapping(value="glist.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectGroupList(int no) {
		ArrayList<AddressGroup> list = mService.selectGropList(no);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="insertAddGroup.ad", produces="application/json; charset=UTF-8")
	public String insertAddressGroup(AddressGroup ag) {
		int result = mService.insertAddressGroup(ag);
		return result>0 ? "success" : "fail";
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
