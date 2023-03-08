package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.dao.MailDao;
import com.aw.anyware.mail.model.vo.AddressBook;

@Service
public class MailServiceImle implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;

	@Override
	public int selectListCount() {
		return 0;
	}

	
	//주소록
	
	@Override
	public int selectAddressListCount() {
		return mDao.selectAddressListCount(sqlSession);
	}

	@Override
	public ArrayList<AddressBook> selectAddbookList(PageInfo pi) {
		return mDao.selectAddbookList(sqlSession, pi);
	}

}
