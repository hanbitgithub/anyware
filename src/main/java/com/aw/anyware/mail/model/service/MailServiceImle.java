package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.dao.MailDao;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;

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
	public int selectAddressListCount(int memNo) {
		return mDao.selectAddressListCount(sqlSession,memNo);
	}

	@Override
	public ArrayList<AddressBook> selectAddbookList(PageInfo pi, int memNo) {
		return mDao.selectAddbookList(sqlSession, pi,memNo);
	}
	
	@Override
	public ArrayList<AddressGroup> selectGroupList(int memNo) {
		return mDao.selectGroupList(sqlSession,memNo);
	}
	
	@Override
	public int insertAddressGroup(AddressGroup ag) {
		return mDao.insertAddressGroup(sqlSession,ag);
	}
	
	@Override
	public int insertAddressBook(AddressBook ab) {
		return mDao.insertAddressBook(sqlSession, ab);
	}


	

	
}
