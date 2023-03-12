package com.aw.anyware.mail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
import com.aw.anyware.mail.model.vo.MailStatus;
import com.aw.anyware.member.model.vo.Member;

import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	//메일 메인페이지 (받은메일함)
	@RequestMapping("receivebox.em")
	public String receiveMailList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session,Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		//그룹리스트 
		ArrayList<AddressGroup> glist = mService.selectGroupList(memNo);
	
		//받은 메일갯수 조회
		int listCount = mService.selectReceiveMailListCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		//받은 메일 리스트 조회 
		ArrayList<Mail> rlist = mService.selectReceiveMailList(pi,memId);
        
		//System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pi",pi);
		return "mail/receiveMailBox";
	}
	
	//보낸메일함 
	@RequestMapping("sendbox.em")
	public String sendMailList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session,Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();

		//보낸메일 갯수조회
		int listCount = mService.selectSendMailListCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> slist = mService.selectSendeMailList(pi,memId);
		
		model.addAttribute("slist", slist);
		model.addAttribute("pi",pi);
		model.addAttribute("listCount",listCount);
		
		
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
	
	//메일 작성폼 
	@RequestMapping("sendForm.em")
	public String sendMailForm(HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		List<Map<String, Object>> groupList = mService.addressbookGroupList(memNo);
	    model.addAttribute("groupList", groupList);
	   // System.out.println(groupList);
	    List<Map<String, Object>> memberList = mService.addressbookMemberList();
	    model.addAttribute("memberList",memberList);

		return "mail/sendMailForm";
		
	}
	
	// 메일전송 기록이있는 사람 조회 
	@ResponseBody
	@RequestMapping(value="reList.em", produces="application/json; charset=utf-8")
	public String ajaxReceiverMemberList(String memId) {
		ArrayList<Mail> reList = mService.receiverMemberList(memId);
		 List<Map<String, Object>> memberList = mService.addressbookMemberList();
		return new Gson().toJson(memberList);
	}
	
	//내게쓰기 폼
	@RequestMapping("sendToMe.em")
	public String sendMailToMe() {
		return "mail/sendMailToMe";
	}
	
	//메일 쓰기
	@RequestMapping("sendMail.em")
	public String insertSendMail(Mail m, HttpSession session) {
		//System.out.println(m);	
		String receivers = m.getReceivers();
		receivers = receivers.replaceAll("\"value\":\"", "");
		receivers = receivers.replaceAll("\\[|\\]|\"|\\{|\\}", "");
		
		m.setReceivers(receivers);
		
		String cc = m.getRefEmail();
		cc = cc.replaceAll("\"value\":\"", "");
		cc = cc.replaceAll("\\[|\\]|\"|\\{|\\}", "");
		
		m.setRefEmail(cc);
    
		
		//메일 테이블 insert 
		int result1 = mService.insertSendMail(m);
		
		
		ArrayList<MailStatus> list = new ArrayList<>();
		if(result1>0) {
			// 메일 상태 insert
			// emtype = 0/1/2 (보낸메일/받은메일/참조메일)
			// ----------- 보낸 메일 ------------
				MailStatus ms = new MailStatus();
				ms.setEmType(0);
			
				list.add(ms); // ArrayList<MailStatus>에 추가

				
			//---------- 받은 메일 ---------------
				//받는사람 이름 배열에 담은후 구분자로 나누기
				String[] receiverArr = receivers.split(",");
				for(String r : receiverArr) {
				    String[] parts = r.split(" ");
				    String id = parts[1].split("@")[0];
				   // System.out.println(id);
				    String name = parts[0].split("@")[0];
				   // System.out.println(name);    
				   
				    MailStatus ms2 = new MailStatus();
					ms2.setEmType(1);
					ms2.setReceiverName(name);
					ms2.setReceiver(id);
					
					list.add(ms2);
				}
			//--------- 참조 메일 --------------	
				//참조자 이름 배열에  담은후 구분자로 나누기
				String[] ccArr = cc.split(",");
				for(String c: ccArr) {
					String[] parts = c.split(" ");
					String id = parts[1].split("@")[0];
					String name = parts[0].split("@")[0];
					
					MailStatus ms3 = new MailStatus();
					ms3.setEmType(2);
					ms3.setReceiverName(name);
					ms3.setReceiver(id);
					
					list.add(ms3);
				}
	
		}
		int result2 = mService.insertMailStatus(list);
		
		
		return "mail/successSendmail";
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
	
	//사내 주소록 
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
		return "mail/test";
	}
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "publicMailAddress.ad", produces =
	 * "application/json; charset=UTF-8") public String ajaxSelectPublicAddresss() {
	 * ArrayList<Member> pAdd = mService.selectPublicAddress();
	 * System.out.println(pAdd); return new Gson().toJson(pAdd); }
	 */
	
	
	

}
