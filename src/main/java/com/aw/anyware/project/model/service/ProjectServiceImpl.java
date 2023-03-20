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
import com.aw.anyware.project.model.vo.ProjectMember;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(HashMap<String, Object> map) {
		return pDao.selectListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Project> selectProjectList(HashMap<String, Object> map, PageInfo pi) {
		return pDao.selectProjectList(sqlSession, map, pi);
	}

	@Override
	public int insertProject(HashMap<String, Object> map) {
		
		int result1 = pDao.insertProject(sqlSession, (Project)map.get("pj"));
		
		int result2 = 0;
		int no = 0;
		if(result1 > 0) {
			result2 = pDao.insertProjectMember(sqlSession, (int)map.get("memberNo"));
			no = pDao.selectNewProject(sqlSession);
		} else {
			int result3 = pDao.deleteProject(sqlSession);
		}
		
		return no;
	}
	
	@Override
	public int insertLike(Like like) {
		return pDao.insertLike(sqlSession, like);
	}

	@Override
	public int deleteLike(Like like) {
		return pDao.deleteLike(sqlSession, like);
	}

}
