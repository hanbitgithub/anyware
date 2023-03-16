package com.aw.anyware.groupMap.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.groupMap.model.vo.GroupMap;

@Repository
public class GroupMapDao {

	public ArrayList<GroupMap> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapMapper.selectMemberList");
	}

	
	
}
