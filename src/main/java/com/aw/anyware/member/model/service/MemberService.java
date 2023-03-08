package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.aw.anyware.member.model.vo.Member;


public interface MemberService {
	
	int selectListCount();
	
	ArrayList<Member> selectAllMember();

}
