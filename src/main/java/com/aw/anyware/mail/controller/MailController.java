package com.aw.anyware.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
import com.aw.anyware.member.model.vo.Member;
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
	public String personalAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session, Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		// 주소록 갯수 조회
		int listCount = mService.selectAddressListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		// 주소록 리스트 조회
		ArrayList<AddressBook> list = mService.selectAddbookList(pi,memNo);
		ArrayList<AddressGroup> glist = mService.selectGroupList(memNo);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("glist",glist);
		
		return "mail/personalAddressbook";
	}
	
	// 주소록 그룹리스트 조회 
	@ResponseBody
	@RequestMapping(value="glist.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectGroupList(int no, HttpSession session) {
		ArrayList<AddressGroup> list = mService.selectGroupList(no);
	
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="insertAddGroup.ad", produces="application/json; charset=UTF-8")
	public String ajaxInsertAddressGroup(AddressGroup ag) {
		int result = mService.insertAddressGroup(ag);
		return result>0 ? "success": "fail";
	}
	
	@RequestMapping("insert.ad")
	public String InsertAddressBook(AddressBook ab,HttpSession session) {
		//System.out.println(ab);
		int result = mService.insertAddressBook(ab);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "mail/personalAddressbook";
			
		}else {
			session.setAttribute("alertMsg", "주소록 등록 실패.");
			return "mail/personalAddressbook";
		}
		
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
