package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;

public interface MailService {
	/*메일*/

	int selectListCount();
	
	
	/*주소록*/
	//주소록 조회
	int selectAddressListCount();
	ArrayList<AddressBook> selectAddbookList(PageInfo pi);
	
	//주소록 추가
	int insertAddressBook(AddressBook ab);
	
	
	
	
}
