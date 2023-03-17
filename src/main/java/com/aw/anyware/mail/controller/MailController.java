package com.aw.anyware.mail.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.FileUpload;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.mail.model.service.MailService;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.mail.model.vo.MailFile;
import com.aw.anyware.mail.model.vo.MailStatus;
import com.aw.anyware.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	

	//---------- 주소록-----------
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
	public String selectGroupAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage,int groupNo,AddressGroup ag,HttpSession session, Model model){
		//그룹별 등록된 연락처 수 
		ag.setGroupNo(groupNo);
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
	
	/**
	 * @param currentPage
	 * @param deptName
	 * @param model
	 * @return 부서별 주소록 조회 
	 */
	@RequestMapping("dept.ad")
	public String deptAddBookList(@RequestParam(value="cpage",defaultValue="1")int currentPage,String deptName, Model model) {
		int count = mService.selectdeptAddBookListCount(deptName);
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 10);
		
		ArrayList<Member> mlist = mService.selectdeptAddBookList(pi,deptName);

		model.addAttribute("mlist",mlist);
		model.addAttribute("pi",pi);
		
		return "mail/companyAddressbook";
	}
	
	
	
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
        
		//안읽은 메일 수 조회 
		int unreadCount = mService.selectUnreadReceiveMail(memId);
		//System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pi",pi);
		model.addAttribute("rCount",listCount);
		model.addAttribute("unread",unreadCount);
		
		return "mail/receiveMailBox";
	}
	//안읽은 메일 수 조회 ajax
	@ResponseBody
	@RequestMapping(value="unreadcount.em", produces="application/json; charset=utf-8")
	public String unReadMailCount(String memId) {
		
		int unreadCount = mService.selectUnreadReceiveMail(memId);
		
		//System.out.println("안읽은수:" +unreadCount);
		
		return new Gson().toJson(unreadCount);
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
		
		ArrayList<Mail> slist = mService.selectSendMailList(pi,memId);
		
	
		model.addAttribute("slist", slist);
		model.addAttribute("pi",pi);
		model.addAttribute("listCount",listCount);
		//System.out.println(slist);
		
		return "mail/sendMailBox";
	}
	
	//중요메일 조회 
	@RequestMapping("important.em")
	public String importantMailList(@RequestParam(value="cpage",defaultValue="1")int currentPage,HttpSession session,Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		//중요메일 수
		int listCount = mService.selectImportantMailCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		//중요메일 리스트 
		ArrayList<Mail> ilist = mService.selectImportantMailList(pi,memId);
		
		//System.out.println(ilist);
		
		model.addAttribute("pi", pi);
		model.addAttribute("ilist",ilist);
		
		return "mail/importantMailBox";
	}
	
	//중요메일 별표시 
	@ResponseBody
	@RequestMapping("like.em")
	public String ajaxCheckImportantMail(MailStatus ms) {

		if(ms.getEmType().equals("0")) { // 보낸메일일 경우 받는이 null
			ms.setReceiver(null);
		}
		int result = mService.checkImportantMail(ms);
		return result>0 ? "success": "fail";
	}
	
	//중요메일 해제 
	@ResponseBody
	@RequestMapping("dislike.em")
	public String ajaxUncheckImportantMail(MailStatus ms) {
		if(ms.getEmType().equals("0")) { // 보낸메일일 경우 받는이 null
			ms.setReceiver(null);
		}
		
		int result = mService.uncheckImportantMail(ms);
		return result>0 ? "success": "fail";
	}
	
	//읽음표시
	@ResponseBody
	@RequestMapping("read.em")
	public String ajaxCheckReadMail(MailStatus ms) {

		if(ms.getEmType().equals("0")) { // 보낸메일일 경우 받는이 null
			ms.setReceiver(null);
		}
		int result = mService.checkReadMail(ms);
		return result>0 ? "success": "fail";
	}
	
	//안읽음으로표시 
	@ResponseBody
	@RequestMapping("unread.em")
	public String ajaxUncheckReadMail(MailStatus ms) {

		if(ms.getEmType().equals("0")) { // 보낸메일일 경우 받는이 null
			ms.setReceiver(null);
		}
		int result = mService.uncheckReadMail(ms);
		return result>0 ? "success": "fail";
	}
	
	
	//임시보관함 
	@RequestMapping("storage.em")
	public String temporaryMailList(@RequestParam(value="cpage",defaultValue="1") int currentPage, HttpSession session, Model model) {
		//로그인한 사원번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();

		//임시보관함 갯수조회
		int listCount = mService.selectTempStorageMailCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		//임시보관함 리스트
		ArrayList<Mail> slist = mService.selectTempStorageMailList(pi,memId);
		
	
		model.addAttribute("slist", slist);
		model.addAttribute("pi",pi);
		model.addAttribute("listCount",listCount);
		//System.out.println(pi);
		
		
		return "mail/temporaryStorageMailBox";
	}
	

	//메일 임시저장 
	@ResponseBody
	@RequestMapping("save.em")
	public String ajaxSavetemporaryMail(Mail m,MultipartFile[] upfile,HttpSession session) {
		//System.out.println(m);
		String cc = m.getRefEmail();
		String receivers = m.getReceivers();
		
		if(receivers != null) { 	
			receivers = receivers.replaceAll("\"value\":\"", "");
			receivers = receivers.replaceAll("\\[|\\]|\"|\\{|\\}", "");
			m.setReceivers(receivers);
		}
		
		
		if(cc != null) {
			cc = cc.replaceAll("\"value\":\"", "");
			cc = cc.replaceAll("\\[|\\]|\"|\\{|\\}", "");
			m.setRefEmail(cc);
		}
		
		int result1 = mService.saveTemporaryMail(m);
		
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//메일상태
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)

		
		ArrayList<MailStatus> list = new ArrayList<>();
		if(result1>0) {
			// 메일 상태 insert
			// emtype = 0/1/2 (보낸메일/받은메일/참조메일)
			// ----------- 보낸 메일 ------------
				MailStatus ms = new MailStatus();
				ms.setEmType("0");
				ms.setTempSave("Y");
			
				list.add(ms); // ArrayList<MailStatus>에 추가

			
			//---------- 받은 메일 ---------------
				//받는사람 이름 배열에 담은후 구분자로 나누기
				if(!receivers.equals("")) {
				String[] receiverArr = receivers.split(",");
				for(String r : receiverArr) {
				    String[] parts = r.split(" ");
				    String id = parts[1].split("@")[0];
				   // System.out.println(id);
				    String name = parts[0].split("@")[0];
				   // System.out.println(name);    
				   
				    MailStatus ms2 = new MailStatus();
					ms2.setEmType("1");
					ms2.setReceiverName(name);
					ms2.setReceiver(id);
					ms2.setTempSave("Y");
					list.add(ms2);
				}
				
			 }
			//--------- 참조 메일 --------------	
			if(!cc.equals("")) { // 참조메일이 있을경우 
				
				//참조자 이름 배열에  담은후 구분자로 나누기
				String[] ccArr = cc.split(",");
				for(String c: ccArr) {
					String[] parts = c.split(" ");
					String id = parts[1].split("@")[0];
					String name = parts[0].split("@")[0];
					
					MailStatus ms3 = new MailStatus();
					ms3.setEmType("2");
					ms3.setReceiverName(name);
					ms3.setReceiver(id);
					ms3.setTempSave("Y");
					
					list.add(ms3);
				}
	      	}

		}
		//System.out.println(list);
		 result2 = mService.saveTemporaryMailStatus(list);
		
		//-----------------첨부파일 insert--------------
		
		for (MultipartFile file : upfile) {

			if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				MailFile at = new MailFile();

				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(saveFilePath);
				at.setFileSize((int) file.getSize());

				// at를 attachmentList에 담기
				atList.add(at);
			}
			
			// 첨부파일 보내기
			if (atList.size() > 0) { // 첨부파일이 추가된 경우
				result3 = mService.insertMailAttachment(atList);
			}

			if (result1 > 0 && result2 > 0 && result3 > 0) {
				//session.setAttribute("alertMsg", "메일 저장 완료");
				
			} else {
				session.setAttribute("alertMsg", "메일 저장을 실패했습니다.");
			}


		}

		return new Gson().toJson(result1);
	}
	/*
	 * //임시저장한 메일 번호
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="getEmNo.em",
	 * produces="application/json; charset=utf-8") public String
	 * ajaxSaveMailGetEmNo(String memId) { int emNo =
	 * mService.selectSaveMailGetEmNo(memId);
	 * 
	 * System.out.println(emNo); return new Gson().toJson(emNo); }
	 */
	
	//임시저장 버튼 다시 눌렀을경우 update
	@ResponseBody
	@RequestMapping("updateTemp.em")
	public String ajaxUpdateTemporaryMail(Mail m,MultipartFile[] upfile,HttpSession session) {
		String cc = m.getRefEmail();
		String receivers = m.getReceivers();
		//System.out.println(m);
		if(m.getReceivers() != null) {
			receivers = receivers.replaceAll("\"value\":\"", "");
			receivers = receivers.replaceAll("\\[|\\]|\"|\\{|\\}", "");
			
			m.setReceivers(receivers);
		}else {
			m.setReceivers(m.getMemName() +" "+ m.getSender() +"@anyware.com");
		}
		
		if(m.getRefEmail() != null) {
			cc = cc.replaceAll("\"value\":\"", "");
			cc = cc.replaceAll("\\[|\\]|\"|\\{|\\}", "");
			
			m.setRefEmail(cc);
		}
		int result1 = mService.updateTemporaryMail(m);
		
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//메일상태
		int result3 = 0;
		// 첨부파일
		int result5 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)

		
		ArrayList<MailStatus> list = new ArrayList<>();
		
		if(result1>0) {
			int result2 = mService.deleteTemporaryStatus(m.getEmNo());
			int result4 = mService.deleteAttachment(m.getEmNo());
		
			if(result2>0) {
				// 메일 상태 insert
				// emtype = 0/1/2 (보낸메일/받은메일/참조메일)
				// ----------- 보낸 메일 ------------
					MailStatus ms = new MailStatus();
					ms.setEmType("0");
					ms.setTempSave("Y");
				
					list.add(ms); // ArrayList<MailStatus>에 추가

				
				//---------- 받은 메일 ---------------
					//받는사람 이름 배열에 담은후 구분자로 나누기
					if(!receivers.equals("")) {
					String[] receiverArr = receivers.split(",");
					for(String r : receiverArr) {
					    String[] parts = r.split(" ");
					    String id = parts[1].split("@")[0];
					   // System.out.println(id);
					    String name = parts[0].split("@")[0];
					   // System.out.println(name);    
					   
					    MailStatus ms2 = new MailStatus();
						ms2.setEmType("1");
						ms2.setReceiverName(name);
						ms2.setReceiver(id);
						ms2.setTempSave("Y");
						list.add(ms2);
					}
					
				 }
				//--------- 참조 메일 --------------	
				if(!cc.equals("")) { // 참조메일이 있을경우 
					
					//참조자 이름 배열에  담은후 구분자로 나누기
					String[] ccArr = cc.split(",");
					for(String c: ccArr) {
						String[] parts = c.split(" ");
						String id = parts[1].split("@")[0];
						String name = parts[0].split("@")[0];
						
						MailStatus ms3 = new MailStatus();
						ms3.setEmType("2");
						ms3.setReceiverName(name);
						ms3.setReceiver(id);
						ms3.setTempSave("Y");
						
						list.add(ms3);
					}
		      	}
				
			}
			
		}
		
		
		 result3 = mService.saveTemporaryMailStatus(list);
		
		//-----------------첨부파일 insert--------------

		for (MultipartFile file : upfile) {

			if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				MailFile at = new MailFile();

				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(saveFilePath);
				at.setFileSize((int) file.getSize());

				// at를 attachmentList에 담기
				atList.add(at);
			}
			
			// 첨부파일 보내기
			if (atList.size() > 0) { // 첨부파일이 추가된 경우
				result5 = mService.insertMailAttachment(atList);
			}

			

		}


		return result1*result3*result5 >0 ? "success": "fail";
	}
	
	/**
	 * @param m
	 * @return 나에게 쓰기 임시저장
	 */
	@ResponseBody
	@RequestMapping("saveMe.em")
	public String sendToMeSave(Mail m,MultipartFile[] upfile,HttpSession session) {
		 String memName = m.getMemName();
    	 String sender = m.getSender();
		  m.setReceivers(memName +" "+ sender +"@anyware.com");
		  
		  int result1 = mService.saveTemporaryMail(m);
		 
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//메일상태
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)
  
		  ArrayList<MailStatus> list = new ArrayList<>();
	    	//메일 상태 insert
	    	if(result1>0) {
	    		MailStatus ms = new MailStatus();
		    	ms.setEmType("0");
		    	ms.setReceiverName(memName);
		    	ms.setReceiver(sender);
		    	ms.setTempSave("Y");
		    	
		    	list.add(ms);
	    	}
	    	 result2 = mService.saveTemporaryMailStatus(list);
    	
    	//-----------------첨부파일 insert--------------
		
		for (MultipartFile file : upfile) {

			if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				MailFile at = new MailFile();

				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(saveFilePath);
				at.setFileSize((int) file.getSize());

				// at를 attachmentList에 담기
				atList.add(at);
			}
			
			// 첨부파일 보내기
			if (atList.size() > 0) { // 첨부파일이 추가된 경우
				result3 = mService.insertMailAttachment(atList);
			}

			if (result1 > 0 && result2 > 0 && result3 > 0) {
				//session.setAttribute("alertMsg", "메일 저장 완료");
				
			} else {
				session.setAttribute("alertMsg", "메일 전송을 실패했습니다.");
			}


		}


		  return new Gson().toJson(result1);
		
	}
	
	/**
	 * @param m
	 * @return 나에게쓰기 임시저장 수정 
	 */
	@ResponseBody
	@RequestMapping("updateMeTemp.em")
	public String sendToMetempUpdate(Mail m,MultipartFile[] upfile,HttpSession session) {
		String memName = m.getMemName();
   	 	String sender = m.getSender();
		  m.setReceivers(memName +" "+ sender +"@anyware.com");
		  
		  int result1 = mService.updateTemporaryMail(m);
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//첨부파일삭제 
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)
		 
		
		if(result1>0) {
			 result2 = mService.deleteAttachment(m.getEmNo());
			 
			//-----------------첨부파일 insert--------------
				
			for (MultipartFile file : upfile) {

				if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

					// 저장 파일 경로!
					String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

					// 첨부파일
					MailFile at = new MailFile();

					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(saveFilePath);
					at.setFileSize((int) file.getSize());

					// at를 attachmentList에 담기
					atList.add(at);
				}
				
				// 첨부파일 보내기
				if (atList.size() > 0) { // 첨부파일이 추가된 경우
					result3 = mService.insertMailAttachment(atList);
				}

			
		  }
		}
		 
			return result3 > 0 ? "success": "fail" ;
	
	}
	
	//휴지통 조회 
	@RequestMapping("trash.em")
	public String trashMailList(@RequestParam(value="cpage",defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();

		//휴지통 갯수조회
		int listCount = mService.selectTrashMailCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		//휴지통 리스트
		ArrayList<Mail> list = mService.selectTrashMailList(pi,memId);
		
		//System.out.println(listCount);
		//System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		model.addAttribute("count",listCount);
		return "mail/trashMailBox";
	}
	
	//메일 상세페이지 
	@RequestMapping("mail.em")
	public String selectMailDetail(MailStatus ms,HttpSession session,Model model) {
		// 상세페이지로 들어가는 순간 읽음으로표시
		if(ms.getEmType().equals("0")) { // 보낸메일일 경우 받는이 null
			ms.setReceiver(null);
		}
		int read = mService.checkReadMail(ms); 
		
		//System.out.println(read);
		//ArrayList<MailFile> atList = mService.selectAttachment(emNo); 한번에 

		//int emType = ms.getEmType();
		String box = ms.getBox();
		
		String title = "";
		Mail detail = new Mail(); // 메일 상세조회
		
		if(read>0) {
		   
			switch(box) {
		   //보낸메일
		   case "0" : 
			   title = "보낸메일함";
			   detail = mService.selectMailDetail(ms);
			   break;
			
		   case "1" : 
			   title = "받은메일함";
			   detail = mService.selectMailDetail(ms);
			   break;
			
		   case "2" :
			  title = "중요메일함";
			  detail = mService.selectMailDetail(ms);
			  break; 
		   case "3" : 
			   title = "내게쓴메일함";
			   detail = mService.selectMailDetail(ms);
		   
		   case "4" : 
			   title = "임시보관함";
			   detail = mService.selectMailDetail(ms);
			   break;
		   
		   case "5" : 
			   title = "휴지통";
			   detail = mService.selectMailDetail(ms);
			   break;
   
		   }
		
		
		}
		//System.out.println(detail);
		
		model.addAttribute("title", title);
		model.addAttribute("m",detail);
		
		return "mail/mailDetailView";
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
	@RequestMapping("sendToMeForm.em")
	public String sendMailToMeForm() {
		return "mail/sendMailToMe";
	}
	
	//내게쓴메일함
	@RequestMapping("sendToMebox.em")
	public String sendToMeMailList(@RequestParam(value="cpage",defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		//내게쓴 메일 수
		int listCount = mService.selectSendToMeMailCount(memId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		//내게쓴 메일 리스트  
		ArrayList<Mail> rlist = mService.selectSendToMeMailList(pi,memId);
		
		model.addAttribute("rlist",rlist);
		model.addAttribute("pi",pi);
		
		//System.out.println(rlist);
	
		return "mail/sendToMeBox";
	}
	
	
	//내게쓰기 insert
    @RequestMapping("sendToMe.em")
    public String insertSendToMe(Mail m,MultipartFile[] upfile ,Model model,HttpSession session) {
    	//메일 테이블 insert
    	//System.out.println(Arrays.toString(upfile));	
    	
    	String memName = m.getMemName();
    	String sender = m.getSender();
  
    	m.setReceivers(memName + " " + sender + "@anyware.com");
    	
    	int result1 = mService.insertSendMail(m);
    	
    	// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//메일상태
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)

    	
    	model.addAttribute("receivers", memName + " " + sender + "@anyware.com");
    	model.addAttribute("msg","내게 쓴 메일은 [내게쓴메일함]에서 확인할 수 있습니다. ");
    	
    	ArrayList<MailStatus> list = new ArrayList<>();
    	//메일 상태 insert
    	if(result1>0) {
    		MailStatus ms = new MailStatus();
	    	ms.setEmType("3");
	    	ms.setReceiverName(memName);
	    	ms.setReceiver(sender);
	    	
	    	list.add(ms);
    	}
    	  result2 = mService.insertMailStatus(list);
    	
    	//-----------------첨부파일 insert--------------
		
		for (MultipartFile file : upfile) {

			if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				MailFile at = new MailFile();

				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(saveFilePath);
				at.setFileSize((int) file.getSize());

				// at를 attachmentList에 담기
				atList.add(at);
			}
			
			// 첨부파일 보내기
			if (atList.size() > 0) { // 첨부파일이 있는경우 
				result3 = mService.insertMailAttachment(atList);
			}

			if (result1 > 0 && result2 > 0 && result3 > 0) {
				session.setAttribute("alertMsg", "메일 전송 완료");
			} else {	
				session.setAttribute("alertMsg", "메일 전송을 실패했습니다.");
			}

		}
    	   return "mail/successSendmail";
    	
    }
	
	
	//메일 쓰기
	@RequestMapping("sendMail.em")
	public String insertSendMail(Mail m,MultipartFile[] upfile, HttpSession session,Model model) {
		//System.out.println(Arrays.toString(fileUpload));	
		
		
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<MailFile> atList = new ArrayList<>();

		//메일상태
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0)

	
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

		model.addAttribute("receivers",receivers);
		model.addAttribute("cc",cc);
		
		ArrayList<MailStatus> list = new ArrayList<>();
		if(result1>0) {
			// 메일 상태 insert
			// emtype = 0/1/2 (보낸메일/받은메일/참조메일)
			// ----------- 보낸 메일 ------------
				MailStatus ms = new MailStatus();
				ms.setEmType("0");
			
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
					ms2.setEmType("1");
					ms2.setReceiverName(name);
					ms2.setReceiver(id);
					
					list.add(ms2);
				}
				
		
			//--------- 참조 메일 --------------	
			if(!cc.equals("")) { // 참조메일이 있을경우 
				
				//참조자 이름 배열에  담은후 구분자로 나누기
				String[] ccArr = cc.split(",");
				for(String c: ccArr) {
					String[] parts = c.split(" ");
					String id = parts[1].split("@")[0];
					String name = parts[0].split("@")[0];
					
					MailStatus ms3 = new MailStatus();
					ms3.setEmType("2");
					ms3.setReceiverName(name);
					ms3.setReceiver(id);
					
					list.add(ms3);
				}

	      	}
			result2 = mService.insertMailStatus(list);
				
		 }
		//-----------------첨부파일 insert--------------
		
		for (MultipartFile file : upfile) {

			if (!file.getOriginalFilename().equals("")) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				MailFile at = new MailFile();

				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(saveFilePath);
				at.setFileSize((int) file.getSize());

				// at를 attachmentList에 담기
				atList.add(at);
			}
			
			// 첨부파일 보내기
			if (atList.size() > 0) { // 첨부파일이 추가된 경우
				result3 = mService.insertMailAttachment(atList);
			}

			if (result1 > 0 && result2 > 0 && result3 > 0) {
				session.setAttribute("alertIcon", "success");
				session.setAttribute("alertTitle", "메일 전송 완료");
				//session.setAttribute("alertMsg", "성공적으로 메일을 보냈습니다.");
			} else {
				session.setAttribute("alertIcon", "error");
				session.setAttribute("alertTitle", "메일 전송 실패");
				session.setAttribute("alertMsg", "메일 전송을 실패했습니다.");
			}

		}

	
		return "mail/successSendmail";
	}
	@ResponseBody
	@RequestMapping("delete.em")
	public String deleteMail(MailStatus ms) {
		
		ArrayList<MailStatus> list = new ArrayList<>();

		// 결과값
		int result = 0;
		String[] mailNo = ms.getEmNo().split(",");
		String[] mailType = ms.getEmType().split(",");
		
		for(int i=0; i<mailNo.length; i++) {
			MailStatus ms2 = new MailStatus();
			ms2.setSender(ms.getSender());
			ms2.setEmNo(mailNo[i]);
			ms2.setEmType(mailType[i]);
			if(mailType[i].equals("0")) {
				ms2.setReceiver(null);
			}else {
				ms2.setReceiver(ms.getReceiver());
			}

			list.add(ms2);
		}
		
		//System.out.println(list);
		
		result = mService.deleteMail(list);
		
		return result > 0 ? "success": "fail";
	    
	}
	
	@ResponseBody
	@RequestMapping("checkRead.em")
	public String checkReadMail(MailStatus ms) {
		
		    //System.out.println(ms);
		// 읽음표시하는 메일 목록을 담을 ArrayList
			ArrayList<MailStatus> list = new ArrayList<>();

			// 결과값
			int result = 0;
			String[] mailNo = ms.getEmNo().split(",");
			String[] mailType = ms.getEmType().split(",");
			
			for(int i=0; i<mailNo.length; i++) {
				MailStatus ms2 = new MailStatus();
				ms2.setSender(ms.getSender());
				ms2.setEmNo(mailNo[i]);
				ms2.setEmType(mailType[i]);
				if(mailType[i].equals("0")) {
					ms2.setReceiver(null);
				}else {
					ms2.setReceiver(ms.getReceiver());
				}
				
					
				
				list.add(ms2);
			}
			
			//System.out.println(list);
			
			result = mService.checkReadMail(list);
			
			return result > 0 ? "success": "fail";
		
	}
	@ResponseBody
	@RequestMapping("checkUnRead.em")
	public String checkUnReadMail(MailStatus ms) {
	    
			// 읽음표시하는 메일 목록을 담을 ArrayList
				ArrayList<MailStatus> list = new ArrayList<>();

				// 결과값
				int result = 0;
				String[] mailNo = ms.getEmNo().split(",");
				String[] mailType = ms.getEmType().split(",");
				
				for(int i=0; i<mailNo.length; i++) {
					MailStatus ms2 = new MailStatus();
					ms2.setSender(ms.getSender());
					ms2.setEmNo(mailNo[i]);
					ms2.setEmType(mailType[i]);
					if(mailType[i].equals("0")) {
						ms2.setReceiver(null);
					}else {
						ms2.setReceiver(ms.getReceiver());
					}
					
						
					
					list.add(ms2);
				}
				
				//System.out.println(list);
				
				result = mService.checkUnReadMail(list);
				
				return result > 0 ? "success": "fail";
	
	}

	
	

}
