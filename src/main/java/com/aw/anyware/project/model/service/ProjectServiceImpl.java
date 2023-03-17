package com.aw.anyware.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.dao.ProjectDao;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return pDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Project> selectProjectList(int memberNo, PageInfo pi) {
		return pDao.selectProjectList(sqlSession, memberNo, pi);
	}

	@Override
	public int insertProject(Project pj) {
		return pDao.insertProject(sqlSession, pj);
	}
	
	@Override
	public int selectSearchListCount(HashMap<String, Object> map) {
		return pDao.selectSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Project> searchProject(HashMap<String, Object> map) {
		return pDao.searchProject(sqlSession, map);
	}

	@Override
	public int insertLike(Like like) {
		return pDao.insertLike(sqlSession, like);
	}

	@Override
	public int deleteLike(Like like) {
		return pDao.deleteLike(sqlSession, like);
	}

	@Override
	public int selectMyListCount(int memberNo) {
		return pDao.selectMyListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Project> selectMyProjectList(int memberNo, PageInfo pi) {
		return pDao.selectMyProjectList(sqlSession, memberNo, pi);
	}

}
