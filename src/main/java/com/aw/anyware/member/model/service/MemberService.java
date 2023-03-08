package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.aw.anyware.member.model.vo.Member;


public interface MemberService {
	//전체회원조회 
	int selectListCount();
	
	ArrayList<Member> selectAllMember();
	
	//로그인
	Member loginMember(Member m);
	
	

}
