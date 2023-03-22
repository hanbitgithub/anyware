package com.aw.anyware.groupMap.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
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

	@Override
	public ArrayList<GroupMap> ajaxSelectMemberList(int memberNo) {
		return gDao.ajaxSelectMemberList(sqlSession, memberNo);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return gDao.selectSearchCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<GroupMap> searchMemberList(PageInfo pi, String keyword) {
		return gDao.searchMemberList(sqlSession, pi, keyword);
	}


}
