package com.aw.anyware.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;
import com.aw.anyware.mail.model.vo.AddressGroup;

@Repository
public class MailDao {
	
	//주소록
	public int selectAddressListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectAddressListCount");
	}
	
	public ArrayList<AddressBook> selectAddbookList(SqlSessionTemplate sqlSession, PageInfo pi){
		//페이징 처리
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectAddbookList",null,rowBounds);
		
	}
	
	//주소록메뉴바 그룹 조회
	public ArrayList<AddressGroup> selectGroupList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectGroupList", memNo);
	}
	
	//주소록 그룹 추가
	public int insertAddressGroup(SqlSessionTemplate sqlSession, AddressGroup ag) {
		return sqlSession.insert("mailMapper.insertAddressGroup",ag);
	}

}