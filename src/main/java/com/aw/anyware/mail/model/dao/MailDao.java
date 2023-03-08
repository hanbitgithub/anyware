package com.aw.anyware.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.mail.model.vo.AddressBook;

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

}