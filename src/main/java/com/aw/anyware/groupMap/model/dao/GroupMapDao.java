package com.aw.anyware.groupMap.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.groupMap.model.vo.GroupMap;

@Repository
public class GroupMapDao {

	public ArrayList<GroupMap> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapMapper.selectMemberList");
	}

	public ArrayList<GroupMap> ajaxSelectMemberList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("groupMapMapper.ajaxSelectMemberList", memberNo);
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("groupMapMapper.selectSearchCount", keyword);
	}

	public ArrayList<GroupMap> searchMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("groupMapMapper.searchMemberList", keyword, rowBounds);
	}
	


	
	
}
