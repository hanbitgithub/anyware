package com.aw.anyware.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.dao.MailDao;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.member.model.vo.Member;

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
	
	/**
	 * 개인 주소록 전체 리스트 수
	 *  
	 */
	@Override
	public int selectAddressListCount(int memNo) {
		return mDao.selectAddressListCount(sqlSession,memNo);
	}
	
	/**
	 * 개인 주소록 전체리스트 
	 * @param : 페이징 처리 , 로그인한 회원번호  
	 */
	@Override
	public ArrayList<AddressBook> selectAddbookList(PageInfo pi, int memNo) {
		return mDao.selectAddbookList(sqlSession, pi,memNo);
	}
	
	/**
	 * 개인 주소록 그룹리스트 
	 */
	@Override
	public ArrayList<AddressGroup> selectGroupList(int memNo) {
		return mDao.selectGroupList(sqlSession,memNo);
	}
	
	/**
	 * 주소록 그룹 추가 
	 */
	@Override
	public int insertAddressGroup(AddressGroup ag) {
		return mDao.insertAddressGroup(sqlSession,ag);
	}
	
	/**
	 * 주소록 연락처 추가 
	 */
	@Override
	public int insertAddressBook(AddressBook ab) {
		return mDao.insertAddressBook(sqlSession, ab);
	}


	/**
	 * 그룹별 리스트 수 
	 */
	@Override
	public int selectGroupAddListCount(AddressGroup ag) {
		return mDao.selectGroupAddListCount(sqlSession, ag);
	}

	/**
	 * 그룹별 리스트 
	 */
	@Override
	public ArrayList<AddressBook> selectGroupAddList(PageInfo pi, AddressGroup ag) {
		return mDao.selectGroupAddList(sqlSession,pi, ag);
	}


	@Override
	public AddressGroup selectInsertGroup(AddressGroup ag) {
		return mDao.selectInsertGroup(sqlSession,ag);
	}
	
	

	/**
	 * 사내 주소록 조회 
	 */
	@Override
	public int selectCompanyListCount() {
		return mDao.selectCompanyListCount(sqlSession);
	}


	@Override
	public ArrayList<Member> selectCompanyList(PageInfo pi) {
		return mDao.selectCompanyList(sqlSession, pi);
	}


	

	
}
