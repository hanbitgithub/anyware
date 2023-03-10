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
	//주소록 리스트 조회
	public int selectAddressListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("mailMapper.selectAddressListCount",memNo);
	}
	
	public ArrayList<AddressBook> selectAddbookList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		//페이징 처리
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectAddbookList",memNo,rowBounds);
		
	}
	
	//주소록메뉴바 그룹 조회
	public ArrayList<AddressGroup> selectGroupList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectGroupList", memNo);
	}
	
	//주소록 그룹 추가
	public int insertAddressGroup(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.insert("mailMapper.insertAddressGroup",ag);
	}
	
	//등록한 그룹 정보
	public AddressGroup selectInsertGroup(SqlSessionTemplate sqlSession,AddressGroup ag) {
		//System.out.println(ag);
		return sqlSession.selectOne("mailMapper.selectInsertGroup",ag);
	}
	
	//주소록 추가
	public int insertAddressBook(SqlSessionTemplate sqlSession, AddressBook ab) {
		return sqlSession.insert("mailMapper.insertAddressBook",ab);
	}
	
	// 그룹별 리스트 수
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
	
	
	public int selectCompanyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectCompanyListCount");
	}
	
	public ArrayList<Member> selectCompanyList(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("mailMapper.selectCompanyList",null,rowBounds);
	}

}