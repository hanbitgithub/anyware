package com.aw.anyware.project.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.project.model.vo.Project;

public interface ProjectService {
	
	// 프로젝트 리스트 조회 서비스(select)
	int selectListCount();
	ArrayList<Project> selectProjectList(int memberNo, PageInfo pi);
	
	// 프로젝트 생성 서비스(insert)
	int insertProject(Project pj);
	
	// 프로젝트 검색 서비스(select)
	ArrayList<Project> selectSearchProject(String keyword);
	
	// 즐겨찾기 추가 서비스(insert)
	int insertLike();
	
	// 즐겨찾기 해제 서비스(delete)
	int deleteLike();
	
	
}
