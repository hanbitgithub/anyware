package com.aw.anyware.mail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.mail.model.vo.MailFile;
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
	
	// 받은메일 개수, 리스트 조회
	int selectReceiveMailListCount(String memId);
	ArrayList<Mail> selectReceiveMailList(PageInfo pi, String memId);

	// 안읽은 메일 수 조회
	int selectUnreadReceiveMail(String memId);

	// 메일 개인주소록 조회
	List<Map<String, Object>> addressbookGroupList(int memNo);

	// 메일 전사주소록 조회
	List<Map<String, Object>> addressbookMemberList();

	// 보낸적있는 메일주소 조회
	ArrayList<Mail> receiverMemberList(String memId);

	// 보낸 메일 개수, 리스트 조회
	int selectSendMailListCount(String memId);
	ArrayList<Mail> selectSendMailList(PageInfo pi, String memId);

	// 메일 작성
	// 메일 테이블 insert
	int insertSendMail(Mail m);
	// 메일status 테이블 insert
	int insertMailStatus(ArrayList<MailStatus> list);
	// 메일 첨부파일 insert
	int insertMailAttachment(ArrayList<MailFile> atList);

	// 중요메일함 개수, 리스트조회
	int selectImportantMailCount(String memId);
	ArrayList<Mail> selectImportantMailList(PageInfo pi, String memId);
	
	//중요메일 표시
	int checkImportantMail(MailStatus ms);
	
	//중요메일 해제
	int uncheckImportantMail(MailStatus ms);
	
	//메일 읽음표시
	int checkReadMail(MailStatus ms);
	
	//메일 안읽음표시
	int uncheckReadMail(MailStatus ms);
	
	//내게쓴 메일함 개수, 리스트 조회
	int selectSendToMeMailCount(String memId);
	ArrayList<Mail> selectSendToMeMailList(PageInfo pi, String memId);
	
	//임시보관함개수, 리스트조회
	int selectTempStorageMailCount(String memId);
	ArrayList<Mail> selectTempStorageMailList(PageInfo pi, String memId);
	
	//메일 임시보관
	int saveTemporaryMail(Mail m);
	int saveTemporaryMailStatus(ArrayList<MailStatus> list);
	
	//메일 임시보관 업데이트
	int updateTemporaryMail(Mail m);
	int deleteTemporaryStatus(int emNo);
	int deleteAttachment(int emNo);
	
	
	//휴지통 개수, 리스트조회
	int selectTrashMailCount(String memId);
	ArrayList<Mail> selectTrashMailList(PageInfo pi, String memId);
	
	//체크메일삭제
	int deleteMail(ArrayList<MailStatus> list);
	
	//체크메일읽음/ 안읽음
	int checkReadMail(ArrayList<MailStatus> list);
	int checkUnReadMail(ArrayList<MailStatus> list);
	
	
	//메일상세조회 
	Mail selectMailDetail(MailStatus ms);
	
	//선택메일 완전삭제
	int deleteTrashMail(ArrayList<MailStatus> list);
	
	//선택메일 복구
	int restoreTrashMail(ArrayList<MailStatus> list);
	
	//답장 메일내용조회
	Mail selectReplyMail(int emNo);
	
	//휴지통상세페이지 영구삭제
	int removeDetailMail(MailStatus ms);
	//상세페이지 삭제
	int deleteDetailMail(MailStatus ms);
	
}
