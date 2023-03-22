package com.aw.anyware.mail.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
import com.aw.anyware.mail.model.vo.Mail;
import com.aw.anyware.mail.model.vo.MailFile;
import com.aw.anyware.mail.model.vo.MailStatus;
import com.aw.anyware.member.model.vo.Member;

@Repository
public class MailDao {
	
	//주소록
	
	/**
	 * @param sqlSession
	 * @param memNo
	 * @return 전체 주소록 리스트 수 
	 */
	public int selectAddressListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("mailMapper.selectAddressListCount",memNo);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memNo
	 * @return 전체 주소록 리스트 
	 */
	public ArrayList<AddressBook> selectAddbookList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		//페이징 처리
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectAddbookList",memNo,rowBounds);
		
	}
	
	
	/**
	 * @param sqlSession
	 * @param memNo
	 * @return 주소록메뉴바 그룹리스트 조회
	 */
	public ArrayList<AddressGroup> selectGroupList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectGroupList", memNo);
	}
	
	/**
	 * @param sqlSession
	 * @param ag
	 * @return 주소록 그룹 추가 
	 */
	public int insertAddressGroup(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.insert("mailMapper.insertAddressGroup",ag);
	}
	
	
	/**
	 * @param sqlSession
	 * @param ag
	 * @return 등록한 그룹 정보 
	 */
	public AddressGroup selectInsertGroup(SqlSessionTemplate sqlSession,AddressGroup ag) {
		//System.out.println(ag);
		return sqlSession.selectOne("mailMapper.selectInsertGroup",ag);
	}
	
	/**
	 * @param sqlSession
	 * @param ag
	 * @return 그룹명 수정
	 */
	public int updateGroupName(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.update("mailMapper.updateGroupName", ag);
	}
	
	/**
	 * @param sqlSession
	 * @param ag
	 * @return 그룹 삭제 
	 */
	public int deleteGroup(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.delete("mailMapper.deleteGroup",ag);
	}
	
	public int deleteGroupList(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.delete("mailMapper.deleteGroupList",ag);
	}
	

	/**
	 * @param sqlSession
	 * @param ab
	 * @return 주소록 추가
	 */
	public int insertAddressBook(SqlSessionTemplate sqlSession, AddressBook ab) {
		return sqlSession.insert("mailMapper.insertAddressBook",ab);
	}
	
	/**
	 * @param sqlSession
	 * @param addPerNo
	 * @return 선택한 주소록 삭제 
	 */
	public int deleteAddressBook(SqlSessionTemplate sqlSession, String addPerNo) {
		String[] arr = addPerNo.split(","); // 선택한 String값 배열에 담기
		
		return sqlSession.delete("mailMapper.deleteAddressBook", arr);
	}
	
	/**
	 * @param sqlSession
	 * @param addNo
	 * @return 선택한 주소록 정보 
	 */
	public AddressBook selectAddressInfo(SqlSessionTemplate sqlSession, int addNo) {
		 return sqlSession.selectOne("mailMapper.selectAddressInfo", addNo);
	}
	
	/**
	 * @param sqlSession
	 * @param ab
	 * @return 주소록 수정 
	 */
	public int updateAddressBook(SqlSessionTemplate sqlSession, AddressBook ab) {
		return sqlSession.update("mailMapper.updateAddressBook", ab);
	}
	
	/**
	 * @param sqlSession
	 * @param ag
	 * @return 그룹명 주소록 리스트 수
	 */
	public int selectGroupAddListCount(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.selectOne("mailMapper.selectGroupAddListCount",ag);
	}

	/**
	 * @param sqlSession
	 * @param pi
	 * @param ag
	 * @return 그룹별 주소록 리스트 
	 */
	public ArrayList<AddressBook> selectGroupAddList(SqlSessionTemplate sqlSession,PageInfo pi, AddressGroup ag){
		//페이징 처리
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectGroupAddList",ag,rowBounds);
	}
	
	
	/**
	 * @param sqlSession
	 * @return 사내 주소록 조회
	 */
	public int selectCompanyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectCompanyListCount");
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @return 사내 주소록 리스트
	 */
	public ArrayList<Member> selectCompanyList(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectCompanyList",null,rowBounds);
	}
	
	/**
	 * @param sqlSession
	 * @param deptName
	 * @return 부서별 주소록 수 
	 */
	public int selectdeptAddBookListCount(SqlSessionTemplate sqlSession,String deptName) {
		return sqlSession.selectOne("mailMapper.selectdeptAddBookListCount",deptName);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param deptName
	 * @return 부서별 주소록 리스트 
	 */
	public ArrayList<Member> selectdeptAddBookList(SqlSessionTemplate sqlSession,PageInfo pi,String deptName){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectdeptAddBookList",deptName,rowBounds);
	}
	
	/**
	 * @param sqlSession
	 * @param keyword
	 * @return 사내 주소록 검색 
	 */
	public int selectEmpSearchCount(SqlSessionTemplate sqlSession,String keyword) {
		return sqlSession.selectOne("mailMapper.selectEmpSearchCount",keyword);
	}
	
	public ArrayList<Member> selectEmpSearchList(SqlSessionTemplate sqlSession,String keyword, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectEmpSearchList",keyword,rowBounds);
		
	}
	
	
	/**
	 * @param sqlSession
	 * @param keyword
	 * @return 개인주소록 검색 
	 */
	public int selectPerSearchCount(SqlSessionTemplate sqlSession,AddressBook ad) {
		return sqlSession.selectOne("mailMapper.selectPerSearchCount",ad);
	}
	
	public ArrayList<Member> selectPerSearchList(SqlSessionTemplate sqlSession,AddressBook ad, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectPerSearchList",ad,rowBounds);
		
	}
	
	
	
	//-------------------------------메일--------------------------------------
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 받은메일 개수 
	 */
	public int selectReceiveMailListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectReceiveMailListCount",memId);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memId
	 * @return 받은메일 리스트 조회 (페이징처리)
	 */
	public ArrayList<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession,PageInfo pi, String memId){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList",memId,rowBounds);
	}

	/**
	 * @param sqlSession
	 * @param memId
	 * @return 읽지않은 메일수 (받은메일)
	 */
	public int selectUnreadReceiveMail(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectUnreadReceiveMail",memId);
	}
	
	
	/**
	 * @param sqlSession
	 * @param memNo
	 * @return 개인주소록 그룹별 조회 
	 */
	public List<Map<String, Object>> addressbookGroupList(SqlSessionTemplate sqlSession, int memNo){
		return sqlSession.selectList("mailMapper.addressbookGroupList",memNo);
	}
	
	/**
	 * @param sqlSession
	 * @return 사내 주소록 부서별 조회 
	 */
	public List<Map<String, Object>> addressBookMemberList(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("mailMapper.addressBookMemberList");
	}
	
	/**
	 * @param sqlSession
	 * @return 보낸적있는 메일 주소 조회 
	 */
	public ArrayList<Mail> receiverMemberList(SqlSessionTemplate sqlSession,String memId){
		return (ArrayList)sqlSession.selectList("mailMapper.receiverMemberList",memId);
	}
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 보낸 메일 개수 조회
	 */
	public int selectSendMailListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectSendMailListCount", memId);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memId
	 * @return 보낸메일 리스트 조회 
	 */
	public ArrayList<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memId){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList",memId,rowBounds);
				
	}
	
	/**
	 * @param sqlSession
	 * @param m
	 * @return 메일쓰기 (메일table)
	 */
	public int insertSendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertSendMail",m);
	}
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 메일쓰기 (메일상태table)
	 */
	public int insertMailStatus(SqlSessionTemplate sqlSession,ArrayList<MailStatus> list) {
		int result = 0;
		for(MailStatus ms : list) {
			result += sqlSession.insert("mailMapper.insertMailStatus", ms);
		}
		
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param atList
	 * @return 메일쓰기 (첨부파일 upload)
	 */
	public int insertMailAttachment(SqlSessionTemplate sqlSession, ArrayList<MailFile> atList) {
		int result = 0;
		for(MailFile at : atList) {
			result += sqlSession.insert("mailMapper.insertMailAttachment", at);
		}
		return result;
	}
	
	
	
	/**
	 * @param sqlSession
	 * @param m
	 * @return 내게쓰기 (메일 테이블 insert)
	 */
	public int insertSendToMe(SqlSessionTemplate sqlSession,Mail m) {
		return sqlSession.insert("mailMapper.insertSendToMe",m);
	}
	
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 중요메일 개수 
	 */
	public int selectImportantMailCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectImportantMailCount",memId);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memId
	 * @return 중요메일 리스트 
	 */
	public ArrayList<Mail> selectImportantMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectImportantMailList",memId,rowBounds);
	}
	
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 중요메일 체크시 important = 'Y' 상태 변경 
	 */
	public int checkImportantMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.checkImportantMail",ms);
	}
	
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 중요메일 체크해제시 important = 'N' 상태변경 
	 */
	public int uncheckImportantMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.uncheckImportantMail",ms);
	}
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 읽음으로 표시 read = 'Y' 상태변경 
	 */
	public int checkReadMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.checkReadMail",ms);
	}
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 안읽음으로 표시 read = 'N' 상태변경 
	 */
	public int uncheckReadMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.uncheckReadMail",ms);
	}
	
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 내게쓴 메일함 개수 조회
	 */
	public int selectSendToMeMailCount(SqlSessionTemplate sqlSession,String memId) {
		return sqlSession.selectOne("mailMapper.selectSendToMeMailCount",memId);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memId
	 * @return 내게쓴 메일함 리스트 조회 
	 */
	public ArrayList<Mail> selectSendToMeMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memId){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
	
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendToMeMailList",memId,rowBounds);
	}
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 임시보관함 개수 
	 */
	public int selectTempStorageMailCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectTempStorageMailCount",memId);
	}
	
	/**
	 * @param sqlSession
	 * @param pi
	 * @param memId
	 * @return 임시보관함 리스트 조회 
	 */
	public ArrayList<Mail> selectTempStorageMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memId){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectTempStorageMailList",memId,rowBounds);
	}
	
	/**
	 * @param sqlSession
	 * @param m
	 * @return 메일 임시저장 
	 */
	public int saveTemporaryMail(SqlSessionTemplate sqlSession, Mail m) {
		   sqlSession.insert("mailMapper.saveTemporaryMail",m);
		   int emNo = m.getEmNo(); // selectKey에서 받아온 emNo
		   return emNo;
	}
	
	
	public int saveTemporaryMailStatus(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {
		int result = 0;
		for(MailStatus ms : list) {
			result += sqlSession.insert("mailMapper.saveTemporaryMailStatus", ms);
		}
		
		return result;
	}
	
	public int deleteTemporaryStatus(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.delete("mailMapper.deleteTemporaryStatus",emNo);
	}
	
	public int deleteAttachment(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.delete("mailMapper.deleteAttachment", emNo);
	}
	
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 임시저장 메일번호 
	 */
	//public int selectSaveMailGetEmNo(SqlSessionTemplate sqlSession, String memId) {
	//	return sqlSession.selectOne("mailMapper.selectSaveMailGetEmNo",memId);
	//}
	
	
	/**
	 * @param sqlSession
	 * @param m
	 * @return 임시저장 메일 수정 
	 */
	public int updateTemporaryMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.update("mailMapper.updateTemporaryMail",m);
	}
	

	/**
	 * @param sqlSession
	 * @param memId
	 * @return 휴지통 메일개수 조회 
	 */
	public int selectTrashMailCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("mailMapper.selectTrashMailCount",memId);
	}
	
	public ArrayList<Mail> selectTrashMailList(SqlSessionTemplate sqlSession,PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashMailList",memId,rowBounds);
	}
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 선택한 메일 삭제 
	 */
	public int deleteMail(SqlSessionTemplate sqlSession,ArrayList<MailStatus> list) {
		
		int result = 0;		
		for(MailStatus ms : list) {
			
			/*if(ms.getReceiver() == null) { // 보낸 메일함
*/				result += sqlSession.update("mailMapper.deleteMail", ms);	
			/*} else
				result += sqlSession.update("mailMapper.deleteReceiveMail", ms);	*/
			/*} else { // 내게쓴 메일함
				result += sqlSession.update("mailMapper.deleteSendToMeMail", ms);
			}*/
			
		}
		return result;

	}
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 체크한 메일 읽음표시 
	 */
	public int checkReadMail(SqlSessionTemplate sqlSession,ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.update("mailMapper.checkReadMail", ms);

		}
		
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 체크한 메일 안읽음으로표시 
	 */
	public int checkUnReadMail(SqlSessionTemplate sqlSession,ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.update("mailMapper.uncheckReadMail", ms);

		}
		
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 메일 상세페이지 조회 
	 */
	public Mail selectMailDetail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.selectOne("mailMapper.selectMailDetail",ms);
	}
	
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 선택 메일 완전 삭제 
	 */
	public int deleteTrashMail(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.delete("mailMapper.deleteTrashMail", ms);

		}
		
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 선택메일 복구 
	 */
	public int restoreTrashMail(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.update("mailMapper.restoreTrashMail", ms);

		}
		
		return result;
	}
	

	/**
	 * @param sqlSession
	 * @param emNo
	 * @return 메일 답장상세조회 
	 */
	public Mail selectReplyMail(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.selectOne("mailMapper.selectReplyMail", emNo);
	}
	
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 휴지통 상세페이지에서 메일삭제
	 */
	public int removeDetailMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.delete("mailMapper.deleteTrashMail",ms);
	}
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 메일상세페이지에서 메일삭제 
	 */
	public int deleteDetailMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.deleteMail",ms);
	}
	
	/**
	 * @param sqlSession
	 * @param list
	 * @return 임시보관함에서 수정시 
	 */
	public int saveTemporaryMailStatus2(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.insert("mailMapper.saveTemporaryMailStatus2",ms);
		}
		
		
		return result;

	}
	
	/**
	 * @param sqlSession
	 * @param m
	 * @return 임시보관함 메일 전송 
	 */
	public int sendTemporaryMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.update("mailMapper.sendTemporaryMail",m);
	}
	
	/**
	 * @param sqlSession
	 * @param atList
	 * @return 임시보관 첨부파일 
	 */
	public int insertTempMailAttachment(SqlSessionTemplate sqlSession, ArrayList<MailFile> atList) {
		int result = 0;
		for(MailFile at : atList) {
			result += sqlSession.insert("mailMapper.insertTempMailAttachment", at);
		}
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param emNo
	 * @return 수신확인 데이터 조회 
	 */
	public ArrayList<MailStatus> selectReceiverData(SqlSessionTemplate sqlSession, String emNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiverData",emNo);
	}
	
	public int cancelMail(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {
		int result = 0;		
		for(MailStatus ms : list) {		
				result += sqlSession.delete("mailMapper.cancelMail", ms);

		}
		
		return result;
	}
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 휴지통 메일 비우기 
	 */
	public int emptyTrashMailBox(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.delete("mailMapper.emptyTrashMailBox", memId);
	}
	
	/**
	 * @param sqlSession
	 * @param memId
	 * @return 메인페이지 리스트 조회 
	 */
	public ArrayList<Mail> selectReceiveMail(SqlSessionTemplate sqlSession, String memId){
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMail",memId);
	}
	
	public ArrayList<Mail> selectSendMail(SqlSessionTemplate sqlSession, String memId){
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMail",memId);
	}
	
	
	/**
	 * @param sqlSession
	 * @param ms
	 * @return 보낸메일 검색 
	 */
	public int selectSearchSendMailCount(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.selectOne("mailMapper.selectSearchSendMailCount",ms);
		
	}
	
	public ArrayList<Mail> selectSearchSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, MailStatus ms){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSearchSendMailList",ms,rowBounds);
	}
	
	
	public int selectSearchReceiveMailCount(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.selectOne("mailMapper.selectSearchReceiveMailCount",ms);
		
	}
	
	public ArrayList<Mail> selectSearchReceiveMailList(SqlSessionTemplate sqlSession, PageInfo pi, MailStatus ms){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSearchReceiveMailList",ms,rowBounds);
	}
	

}