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
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	//메일 메인페이지 
	@RequestMapping("receivebox.em")
	public String receiveMailList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session,Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		//그룹리스트 
		ArrayList<AddressGroup> glist = mService.selectGroupList(memNo);
		session.setAttribute("glist", glist);
		
		//받은 메일갯수 조회
		int listCount = mService.selectReceiveMailListCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		//받은 메일 리스트 조회 
		ArrayList<Mail> rlist = mService.selectReceiveMailList(pi,memId);
        
		model.addAttribute("rlist", rlist);
		model.addAttribute("pi",pi);
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
		
		//System.out.println(glist);
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
	
	//주소록 그룹 추가 
	@ResponseBody
	@RequestMapping("insertAddGroup.ad")
	public String ajaxInsertAddressGroup(AddressGroup ag) {
		int result = mService.insertAddressGroup(ag);
	 	return result>0 ? "success": "fail";
		
		
	}
	
	//그룹명 수정
	@ResponseBody
	@RequestMapping("updateGroup.ad")
	public String updateGroupName(AddressGroup ag) {
		int result = mService.updateGroupName(ag);
		return result>0 ? "success": "fail";
	}
	
	//그룹삭제 
	@ResponseBody
	@RequestMapping("deleteGroup.ad")
	public String deleteGroupName(AddressGroup ag) {
		int result = mService.deleteGroup(ag);
		
		return result >0 ? "success": "fail";
	}

	//주소록 추가 
	@RequestMapping("insert.ad")
	public String InsertAddressBook(AddressBook ab,HttpSession session) {
		//System.out.println(ab);
		int result = mService.insertAddressBook(ab);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:personal.ad";
			
		}else {
			session.setAttribute("alertMsg", "주소록 등록 실패.");
			return "redirect:personal.ad";
		}
		
	}
	//주소록 삭제 
	@ResponseBody
	@RequestMapping("delete.ad")
	public String ajaxDeleteAddressBook(String addPerNo) {
		int result = mService.deleteAddressBook(addPerNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	//주소록 정보 조회
	@ResponseBody
	@RequestMapping(value="getAddressInfo.ad",  produces="application/json; charset=utf-8")
	public String ajaxSelectAddressInfo(int addNo) {
		AddressBook ab = mService.selectAddressInfo(addNo);
		return new Gson().toJson(ab);
	}
	
	//주소록 수정 
	@ResponseBody
	@RequestMapping(value="update.ad")
	public String ajaxUpdateAddressBook(AddressBook ab) {
		//System.out.println(ab);
		int result = mService.updateAddressBook(ab);
		return result > 0 ? "success" : "fail";
	}

	// 그룹별 주소록 조회 
	@RequestMapping("group.ad")
	public String selectGroupAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage,AddressGroup ag,HttpSession session, Model model){
		//그룹별 등록된 연락처 수 
		int listCount = mService.selectGroupAddListCount(ag);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AddressBook> list = mService.selectGroupAddList(pi,ag);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "mail/personalAddressbook";
	}
	
	
	@RequestMapping("company.ad")
	public String companyAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage, Model model) {
		//전 사원수 조회
		int count = mService.selectCompanyListCount();
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 10);
		
		ArrayList<Member> mlist = mService.selectCompanyList(pi);
		
		model.addAttribute("mlist",mlist);
		model.addAttribute("pi",pi);
		
		return "mail/companyAddressbook";
	}
	
	@RequestMapping("dept.ad")
	public String deptAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage,String deptName, Model model) {
		int count = mService.selectdeptAddBookListCount(deptName);
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 10);
		
		ArrayList<Member> mlist = mService.selectdeptAddBookList(pi,deptName);
		
		model.addAttribute("mlist",mlist);
		model.addAttribute("pi",pi);
		
		return "mail/companyAddressbook";
	}
	
	@RequestMapping("test.do")
	public String test() {
		return "mail/test2";
	}


}
