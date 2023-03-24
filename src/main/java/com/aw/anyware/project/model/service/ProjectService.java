package com.aw.anyware.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.List;
import com.aw.anyware.project.model.vo.ListChat;
import com.aw.anyware.project.model.vo.PjMem;
import com.aw.anyware.project.model.vo.Project;
import com.aw.anyware.project.model.vo.Todo;

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
	Project selectProjectDetail(PjMem pm);
	
	// 리스트 추가 서비스(insert)
	int insertList(List list);
	
	// 비공개 프로젝트 참여 요청 서비스(insert)
	int selectRequestStatus(PjMem pm);
	int addRequest(PjMem pm);
	
	// 프로젝트 인원 추가 서비스(insert)
	int addParticipant(PjMem pm);
	Member selectParticipant(PjMem pm);
	
	// 프로젝트 인원 제거 서비스(delete)
	int deleteParticipant(PjMem pm);
	
	// 프로젝트 참여요청 승인 서비스(update)
	int acceptParticipant(PjMem pm);
	
	// 프로젝트 참여요청 거절 서비스(delete)
	int rejectParticipant(PjMem pm);
	
	// 인원 조회 서비스(select)
	ArrayList<Member> selectDeptList();
	ArrayList<Member> selectMemberList();
	ArrayList<Member> selectParticipantList(int projectNo);
	
	// 리스트 조회 서비스(select)
	List selectList(int listNo);
	
	// 할일 추가 서비스(insert)
	Todo addTodo(Todo td);
	
	// 할일 업데이트 서비스(update)
	int updateTodo(HashMap<String, Integer> map);
	
	// 할일 제거 서비스(delete)
	int deleteTodo(int todoNo);
	
	// 리스트 채팅 조회 서비스(select)
	ArrayList<ListChat> selectListChatList(int listNo);
	
	// 리스트 채팅 작성 서비스(insert)
	int insertListChat(ListChat ch);
	
	// 리스트 수정 서비스(update)
	int updateList(List l);
	
}
