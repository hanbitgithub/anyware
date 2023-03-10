package com.aw.anyware.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;
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
	
	
	
	
	

}