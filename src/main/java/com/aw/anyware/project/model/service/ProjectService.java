package com.aw.anyware.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.Project;

public interface ProjectService {
	
	// 프로젝트 리스트 조회 서비스(select)
	int selectListCount();
	ArrayList<Project> selectProjectList(int memberNo, PageInfo pi);
	
	// 프로젝트 생성 서비스(insert)
	int insertProject(Project pj);
	
	// 프로젝트 검색 서비스(select)
	int selectSearchListCount(HashMap<String, Object> map);
	ArrayList<Project> searchProject(HashMap<String, Object> map);
	
	// 즐겨찾기 추가 서비스(insert)
	int insertLike(Like like);
	
	// 즐겨찾기 해제 서비스(delete)
	int deleteLike(Like like);
	
	// 참여중인 프로젝트 리스트 조회 서비스(select)
	int selectMyListCount(int memberNo);
	ArrayList<Project> selectMyProjectList(int memberNo, PageInfo pi);
	
	
}
