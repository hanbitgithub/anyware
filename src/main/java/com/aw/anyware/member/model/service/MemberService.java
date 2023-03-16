package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Commute;
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
	
	
	
	//Member selectDayOff(Member m);
	
	
	
	

}
