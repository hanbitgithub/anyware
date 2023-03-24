package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Commute;
import com.aw.anyware.member.model.vo.LeaveOff;
import com.aw.anyware.member.model.vo.Member;


public interface MemberService {
	//전체회원조회 
	int selectListCount();
	
	ArrayList<Member> selectAllMember(PageInfo pi);
	
	Member detailAllMember(int memberNo);
	
	Member loginUserRrn(int memberNo);
	
	//로그인
	Member loginMember(Member m);
	
	//비밀번호 변경
	Member selectPwd(Member m);
	
	
	int changePwd(Member m);
	
	//사원의 개인정보 업데이트
	int memberPersonalUpdate(Member m);
	
	// 관리자의 사원 정보 업데이트
	int allMemberUpdate(Member m);
	
	//출퇴근
	int insertCommute(Commute c);
	
	int commuteOut(Commute c);
	
	Commute selectCommute(Commute c);
	
	//신규 사원 등록
	
	int insertMember(Member m);
	
	// 퇴사처리
	
	int outMember(int memberNo);
	
	int selectListCountOut();
	
	ArrayList<Member> selectOutMember(PageInfo pi);
	
	//비밀번호 찾기
	
	Member searchPwd(Member m);
	
	int makeNewPwd(Member m); // 비밀번호 찾기에서 비밀번호 변경하는 메소드
	
	// 연차
	
	LeaveOff selectLastOff(Member m);
	
	
	
	//Member selectDayOff(Member m);
	
	//근태현황 조회
	ArrayList<Commute> selectMemberAttendenceList(int memberNo);
	
	Commute selectTodayCommute(int memNo);
	double selectWeeklyCommute(int memNo);
	double selectMonthCommute(int memNo);

}
