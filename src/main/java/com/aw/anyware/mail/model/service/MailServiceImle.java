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
import com.aw.anyware.mail.model.vo.MailFile;
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
	
	
	/**
	 * 사내 주소록 검색 
	 */
	@Override
	public int selectEmpSearchCount(String keyword) {
		return mDao.selectEmpSearchCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Member> selectEmpSearchList(String keyword, PageInfo pi) {
		return mDao.selectEmpSearchList(sqlSession,keyword,pi);
	}
	

	/**
	 * 개인 주소록 검색 
	 */
	@Override
	public int selectPerSearchCount(AddressBook ad) {
		return mDao.selectPerSearchCount(sqlSession, ad);
	}

	@Override
	public ArrayList<Member> selectPerSearchList(AddressBook ad, PageInfo pi) {
		return mDao.selectPerSearchList(sqlSession,ad,pi);
	}
	
	
	
	
	
	//----------------------------------메일---------------------------------------------

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
	 * 받은 메일 중 안읽은 메일 개수 
	 */
	@Override
	public int selectUnreadReceiveMail(String memId) {
		return mDao.selectUnreadReceiveMail(sqlSession,memId);
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
	public ArrayList<Mail> selectSendMailList(PageInfo pi, String memId) {
		return mDao.selectSendMailList(sqlSession,pi,memId);
	}

	/**
	 * 메일 쓰기 ( mail테이블 insert)
	 */
	@Override
	public int insertSendMail(Mail m) {
		return mDao.insertSendMail(sqlSession, m);
	}

	/**
	 * 메일 쓰기 ( mailStatus 테이블 insert)
	 */
	@Override
	public int insertMailStatus(ArrayList<MailStatus> list) {
		return mDao.insertMailStatus(sqlSession, list);
	}
	
	@Override
	public int insertMailAttachment(ArrayList<MailFile> atList) {
		return mDao.insertMailAttachment(sqlSession, atList);
	}

	/**
	 * 중요메일 수 조회 
	 */
	@Override
	public int selectImportantMailCount(String memId) {
		return mDao.selectImportantMailCount(sqlSession,memId);
	}

	/**
	 * 중요메일 리스트 조회 
	 */
	@Override
	public ArrayList<Mail> selectImportantMailList(PageInfo pi, String memId) {
		return mDao.selectImportantMailList(sqlSession, pi, memId);
	}

	/**
	 *  중요메일 표시 
	 */
	@Override
	public int checkImportantMail(MailStatus ms) {
		return mDao.checkImportantMail(sqlSession, ms);
	}

	/**
	 * 중요메일 표시 해제 
	 */
	@Override
	public int uncheckImportantMail(MailStatus ms) {
		return mDao.uncheckImportantMail(sqlSession,ms);
	}

	/**
	 * 메일 읽음표시 
	 */
	@Override
	public int checkReadMail(MailStatus ms) {
		return mDao.checkReadMail(sqlSession, ms);
	}

	/**
	 * 메일 안읽음표시 
	 */
	@Override
	public int uncheckReadMail(MailStatus ms) {
		return mDao.uncheckReadMail(sqlSession, ms);
	}

	/**
	 * 내게쓴 메일함 개수
	 */
	@Override
	public int selectSendToMeMailCount(String memId) {
		return mDao.selectSendToMeMailCount(sqlSession, memId);
	}

	/**
	 * 내게쓴 메일함 리스트 
	 */
	@Override
	public ArrayList<Mail> selectSendToMeMailList(PageInfo pi, String memId) {
		return mDao.selectSendToMeMailList(sqlSession, pi, memId);
	}

	/**
	 * 임시보관함 개수
	 */
	@Override
	public int selectTempStorageMailCount(String memId) {
		return mDao.selectTempStorageMailCount(sqlSession, memId);
	}

	/**
	 * 임시보관함 리스트 
	 */
	@Override
	public ArrayList<Mail> selectTempStorageMailList(PageInfo pi, String memId) {
		return mDao.selectTempStorageMailList(sqlSession, pi,memId);
	}

	/**
	 * 메일 임시저장 
	 */
	@Override
	public int saveTemporaryMail(Mail m) {
		return mDao.saveTemporaryMail(sqlSession, m);
	}
	@Override
	public int saveTemporaryMailStatus(ArrayList<MailStatus> list) {
		return mDao.saveTemporaryMailStatus(sqlSession, list);
	}

	
	/**
	 * 임시저장 메일 수정 
	 */
	@Override
	public int updateTemporaryMail(Mail m) {
		return mDao.updateTemporaryMail(sqlSession,m);
	}

	@Override
	public int deleteTemporaryStatus(int emNo) {
		return mDao.deleteTemporaryStatus(sqlSession,emNo);
	}
	
	@Override
	public int deleteAttachment(int emNo) {
		return mDao.deleteAttachment(sqlSession,emNo);
	}

	
	
	/**
	 * 휴지통 메일개수 조회 
	 */
	@Override
	public int selectTrashMailCount(String memId) {
		return mDao.selectTrashMailCount(sqlSession, memId);
	}

	/**
	 * 휴지통 메일 리스트 
	 */
	@Override
	public ArrayList<Mail> selectTrashMailList(PageInfo pi, String memId) {
		return mDao.selectTrashMailList(sqlSession,pi,memId);
	}

	/**
	 * 체크 메일 삭제 
	 */
	@Override
	public int deleteMail(ArrayList<MailStatus> list) {
		return mDao.deleteMail(sqlSession,list);
	}

	/**
	 * 체크메일 읽음표시
	 */
	@Override
	public int checkReadMail(ArrayList<MailStatus> list) {
		return mDao.checkReadMail(sqlSession,list);
	}

	/**
	 * 체크메일 안읽음 표시 
	 */
	@Override
	public int checkUnReadMail(ArrayList<MailStatus> list) {
		return mDao.checkUnReadMail(sqlSession,list);
	}

	/**
	 * 메일 상세페이지 조회 
	 */
	@Override
	public Mail selectMailDetail(MailStatus ms) {
		return mDao.selectMailDetail(sqlSession,ms);
	}

	/**
	 * 선택메일 완전삭제 
	 */
	@Override
	public int deleteTrashMail(ArrayList<MailStatus> list) {
		return mDao.deleteTrashMail(sqlSession,list);
	}

	/**
	 * 선택메일 복구 
	 */
	@Override
	public int restoreTrashMail(ArrayList<MailStatus> list) {
		return mDao.restoreTrashMail(sqlSession, list);
	}

	/**
	 * 답장메일 내용 조회
	 */
	@Override
	public Mail selectReplyMail(int emNo) {
		return mDao.selectReplyMail(sqlSession, emNo);
	}

	/**
	 * 휴지통 메일 완전삭제 (메일 상세페이지)
	 */
	@Override
	public int removeDetailMail(MailStatus ms) {
		return mDao.removeDetailMail(sqlSession,ms);
	}

	/**
	 * 메일 휴지통으로 이동 (메일 상세페이지)
	 */
	@Override
	public int deleteDetailMail(MailStatus ms) {
		return mDao.deleteDetailMail(sqlSession, ms);
	}

	/**
	 * 임시보관함에서 보관메일 수정시 
	 */
	@Override
	public int saveTemporaryMailStatus2(ArrayList<MailStatus> list) {
		return mDao.saveTemporaryMailStatus2(sqlSession,list);
	}

	/**
	 * 임시보관함 메일 전송 
	 */
	@Override
	public int sendTemporaryMail(Mail m) {
		return mDao.sendTemporaryMail(sqlSession, m);
	}
	
	
	/**
	 * 임시저장 첨부파일 저장
	 */
	public int insertTempMailAttachment(ArrayList<MailFile> atList) {
		return mDao.insertTempMailAttachment(sqlSession, atList);
	}

	/**
	 * 수신확인용 리스트 조회
	 */
	@Override
	public ArrayList<MailStatus> selectReceiverData(String emNo) {
		return mDao.selectReceiverData(sqlSession,emNo);
	}

	/**
	 * 휴지통 메일 비우기 
	 */
	@Override
	public int emptyTrashMailBox(String memId) {
		return mDao.emptyTrashMailBox(sqlSession, memId);
	}

	/**
	 * 메인페이지 받은메일, 보낸메일 조회 
	 */
	@Override
	public ArrayList<Mail> selectReceiveMail(String memId) {
		return mDao.selectReceiveMail(sqlSession,memId);
	}

	@Override
	public ArrayList<Mail> selectSendMail(String memId) {
		return mDao.selectSendMail(sqlSession, memId);
	}


	
	

	


	

		
	

	
	

	
	

	

	


	

	


	


	



	

	

	
}
