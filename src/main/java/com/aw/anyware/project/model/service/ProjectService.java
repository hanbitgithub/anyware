package com.aw.anyware.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.List;
import com.aw.anyware.project.model.vo.Project;

public interface ProjectService {
	
	// 프로젝트 리스트 조회 서비스(select) -- 전체, 전체 검색, 마이, 마이 검색
	int selectListCount(HashMap<String, Object> map);
	ArrayList<Project> selectProjectList(HashMap<String, Object> map, PageInfo pi);
	
	// 프로젝트 생성 서비스(insert)
	int insertProject(HashMap<String, Object> map);
	
	// 즐겨찾기 추가 서비스(insert)
	int insertLike(Like like);
	
	// 즐겨찾기 해제 서비스(delete)
	int deleteLike(Like like);
	
	// 프로젝트 상세 조회 서비스(select)
	Project selectProjectDetail(int projectNo);
	
	// 리스트 추가 서비스(insert)
	int insertList(List list);
	
	// 인원 조회 서비스(select)
	// 부서명 조회(select)
	ArrayList<Member> selectDeptList();
	// 부서별 인원 조회(select)
	ArrayList<Member> selectMemberList();
	
	
}
