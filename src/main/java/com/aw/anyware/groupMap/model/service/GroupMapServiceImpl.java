package com.aw.anyware.groupMap.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.groupMap.model.dao.GroupMapDao;
import com.aw.anyware.groupMap.model.vo.GroupMap;

@Service
public class GroupMapServiceImpl implements GroupMapService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupMapDao gDao;

	@Override
	public ArrayList<GroupMap> selectMemberList() {
		return gDao.selectMemberList(sqlSession);
	}
}
