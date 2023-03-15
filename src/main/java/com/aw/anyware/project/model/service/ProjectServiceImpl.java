package com.aw.anyware.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.project.model.dao.ProjectDao;
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
	public ArrayList<Project> selectSearchProject(String keyword) {
		return null;
	}

	@Override
	public int insertLike() {
		return 0;
	}

	@Override
	public int deleteLike() {
		return 0;
	}

}
