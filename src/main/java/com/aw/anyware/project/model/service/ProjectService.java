package com.aw.anyware.project.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.project.model.vo.Project;

public interface ProjectService {
	
	// 프로젝트 리스트 조회 서비스
	int selectListCount();
	ArrayList<Project> selectProjectList(int memberNo, PageInfo pi);
	
	// 프로젝트 검색 서비스
	
	
	// 

}
