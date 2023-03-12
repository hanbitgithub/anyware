package com.aw.anyware.mail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.dao.MailDao;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.mail.model.vo.MailStatus;
import com.aw.anyware.member.model.vo.Member;


@Service
public class MailServiceImle implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;

	
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


	/**
	 *등록한 그룹 조회 
	 */
	@Override
	public AddressGroup selectInsertGroup(AddressGroup ag) {
		return mDao.selectInsertGroup(sqlSession,ag);
	}
	
	/**
	 * 그룹명 수정 
	 */
	@Override
	public int updateGroupName(AddressGroup ag) {
		return mDao.updateGroupName(sqlSession,ag);
	}
	

	/**
	 *그룹삭제
	 */
	@Override
	public int deleteGroup(AddressGroup ag) {
		return mDao.deleteGroup(sqlSession,ag);
	}
	
	/**
	 * 주소록 연락처 추가 
	 */
	@Override
	public int insertAddressBook(AddressBook ab) {
		return mDao.insertAddressBook(sqlSession, ab);
	}
	
	/**
	 * 주소록 연락처 삭제 
	 */
	@Override
	public int deleteAddressBook(String addPerNo) {
		return mDao.deleteAddressBook(sqlSession, addPerNo);
	}
	
	/**
	 * 선택한 주소록 정보 
	 */
	@Override
	public AddressBook selectAddressInfo(int addNo) {
		return mDao.selectAddressInfo(sqlSession, addNo);
	}
	
	/**
	 * 주소록 수정 
	 */
	@Override
	public int updateAddressBook(AddressBook ab) {
		return mDao.updateAddressBook(sqlSession, ab);
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


	/**
	 * 부서별 주소록 
	 */
	@Override
	public int selectdeptAddBookListCount(String deptName) {
		return mDao.selectdeptAddBookListCount(sqlSession,deptName);
	}


	/**
	 * 부서별 주소록 리스트 
	 */
	@Override
	public ArrayList<Member> selectdeptAddBookList(PageInfo pi,String deptName) {
		return mDao.selectdeptAddBookList(sqlSession, pi,deptName);
	}
	
	//메일

	/**
	 * 받은 메일 갯수 
	 */
	@Override
	public int selectReceiveMailListCount(String memId) {
		return mDao.selectReceiveMailListCount(sqlSession,memId);
	}

	/**
	 * 받은 메일 리스트 
	 */
	@Override
	public ArrayList<Mail> selectReceiveMailList(PageInfo pi, String memId) {
		return mDao.selectReceiveMailList(sqlSession, pi, memId);
	}

	/**
	 * 개인주소록 그룹별 리스트 
	 */
	@Override
	public List<Map<String, Object>> addressbookGroupList(int memNo) {
		return mDao.addressbookGroupList(sqlSession, memNo);
	}

	/**
	 * 사내주소록 부서별 리스트 
	 */
	@Override
	public List<Map<String, Object>> addressbookMemberList() {
		return mDao.addressBookMemberList(sqlSession);
	}

	/**
	 * 보낸적있는 메일주소 조회
	 */
	@Override
	public ArrayList<Mail> receiverMemberList(String memId) {
		return mDao.receiverMemberList(sqlSession, memId);
	}

	/**
	 * 보낸메일함 갯수조회
	 */
	@Override
	public int selectSendMailListCount(String memId) {
		return mDao.selectSendMailListCount(sqlSession, memId);
	}

	/**
	 * 보낸메일함 리스트 조회
	 */
	@Override
	public ArrayList<Mail> selectSendeMailList(PageInfo pi, String memId) {
		return mDao.selectSendMailList(sqlSession,pi,memId);
	}

	/**
	 * 메일 쓰기 ( mail테이블 insert)
	 */
	@Override
	public int insertSendMail(Mail m) {
		return mDao.insertSendMail(sqlSession, m);
	}

	@Override
	public int insertMailStatus(ArrayList<MailStatus> list) {
		return mDao.insertMailStatus(sqlSession, list);
	}
	

	
	

	

	


	

	


	


	



	

	

	
}
