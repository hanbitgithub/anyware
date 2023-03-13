package com.aw.anyware.mail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.mail.model.vo.MailStatus;
import com.aw.anyware.member.model.vo.Member;

public interface MailService {

	
	/*주소록*/
	//개인 주소록 조회 
	int selectAddressListCount(int memNo);
	ArrayList<AddressBook> selectAddbookList(PageInfo pi,int memNo);
	
	//그룹리스트 조회
	ArrayList<AddressGroup> selectGroupList(int memNo);
	
	//그룹추가 
	int insertAddressGroup(AddressGroup ag);

	//등록한 그룹조회
	AddressGroup selectInsertGroup(AddressGroup ag);
	
	//그룹명 수정
	int updateGroupName(AddressGroup ag);
	
	//그룹삭제
	int deleteGroup(AddressGroup ag);

	//그룹별 리스트조회
	int selectGroupAddListCount(AddressGroup ag);
	ArrayList<AddressBook> selectGroupAddList(PageInfo pi, AddressGroup ag);

	//주소록 추가
	int insertAddressBook(AddressBook ab);
	
	//주소록 삭제
	int deleteAddressBook(String addPerNo);
	
	//선택한 주소록 정보 
	AddressBook selectAddressInfo(int addNo);
	
	//주소록 수정 
	int updateAddressBook(AddressBook ab);
	
	//사내주소록 조회 (전체)
	int selectCompanyListCount();
	ArrayList<Member> selectCompanyList(PageInfo pi);
	
	//부서별 주소록
	int selectdeptAddBookListCount(String deptName);
	ArrayList<Member> selectdeptAddBookList(PageInfo pi,String deptName);

	/*메일*/
	
	//받은메일 갯수, 리스트 조회
	int selectReceiveMailListCount(String memId);
	ArrayList<Mail> selectReceiveMailList(PageInfo pi, String memId);
	
	//안읽은 메일 수 조회
	int selectUnreadReceiveMail(String memId);
	
	//메일 개인주소록 조회
	 List<Map<String, Object>> addressbookGroupList(int memNo);
	
	 //메일 전사주소록 조회
	 List<Map<String, Object>> addressbookMemberList();
	 
	 //보낸적있는 메일주소 조회
	 ArrayList<Mail> receiverMemberList(String memId);
	 
	 //보낸 메일 갯수, 리스트 조회
	 int selectSendMailListCount(String memId);
     ArrayList<Mail> selectSendeMailList(PageInfo pi, String memId);

	 //메일 작성 
     //메일 테이블 insert
     int insertSendMail(Mail m);
     //메일status 테이블 insert
     int insertMailStatus(ArrayList<MailStatus> list);
	 
}
