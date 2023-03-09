package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;

public interface MailService {
	/*메일*/

	int selectListCount();
	
	
	/*주소록*/
	//주소록 조회
	int selectAddressListCount(int memNo);
	ArrayList<AddressBook> selectAddbookList(PageInfo pi,int memNo);
	
	//그룹리스트 조회
	ArrayList<AddressGroup> selectGroupList(int memNo);
	//그룹추가 
	int insertAddressGroup(AddressGroup ag);
	
	//주소록 추가
	int insertAddressBook(AddressBook ab);
	

	
}
