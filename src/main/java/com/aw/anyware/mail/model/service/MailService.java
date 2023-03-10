package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.member.model.vo.Member;

public interface MailService {
	/*메일*/

	int selectListCount();
	
	
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
	
	//사내주소록 조회
	int selectCompanyListCount();
	ArrayList<Member> selectCompanyList(PageInfo pi);
	
	//부서별 주소록
	int selectdeptAddBookListCount(String deptName);
	ArrayList<Member> selectdeptAddBookList(PageInfo pi,String deptName);
	
	
	

	
}
