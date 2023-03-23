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
import com.aw.anyware.project.model.vo.List;
import com.aw.anyware.project.model.vo.PjMem;
import com.aw.anyware.project.model.vo.Project;
import com.aw.anyware.project.model.vo.Todo;

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

	@Override
	public Project selectProjectDetail(PjMem pm) {
		return pDao.selectProjectDetail(sqlSession, pm);
	}

	@Override
	public int insertList(List list) {
		return pDao.insertList(sqlSession, list);
	}
	
	@Override
	public int selectRequestStatus(PjMem pm) {
		return pDao.selectRequestStatus(sqlSession, pm);
	}
	
	@Override
	public int addRequest(PjMem pm) {
		return pDao.addRequest(sqlSession, pm);
	}
	
	@Override
	public int addParticipant(PjMem pm) {
		return pDao.addParticipant(sqlSession, pm);
	}
	
	@Override
	public Member selectParticipant(PjMem pm) {
		return pDao.selectParticipant(sqlSession, pm);
	}

	@Override
	public ArrayList<Member> selectDeptList() {
		return pDao.selectDeptList(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		return pDao.selectMemberList(sqlSession);
	}

	@Override
	public ArrayList<Member> selectParticipantList(int projectNo) {
		return pDao.selectParticipantList(sqlSession, projectNo);
	}

	@Override
	public int deleteParticipant(PjMem pm) {
		return pDao.deleteParticipant(sqlSession, pm);
	}

	@Override
	public int acceptParticipant(PjMem pm) {
		return pDao.acceptParticipant(sqlSession, pm);
	}

	@Override
	public int rejectParticipant(PjMem pm) {
		return pDao.rejectParticipant(sqlSession, pm);
	}

	@Override
	public List selectList(int listNo) {
		return pDao.selectList(sqlSession, listNo);
	}

	@Override
	public Todo addTodo(Todo td) {
		
		int result = pDao.addTodo(sqlSession, td);
		
		Todo todo = new Todo();
		if(result > 0) {
			int todoNo = pDao.selectTodoNo(sqlSession);
			todo = pDao.selectTodo(sqlSession, todoNo);
		}
		
		return todo;
	}

	@Override
	public int updateTodo(HashMap<String, Integer> map) {
		return pDao.updateTodo(sqlSession, map);
	}

	@Override
	public int deleteTodo(int todoNo) {
		return pDao.deleteTodo(sqlSession, todoNo);
	}


}
