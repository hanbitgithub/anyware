package com.aw.anyware.chat.model.service;

import java.util.ArrayList;

import com.aw.anyware.member.model.vo.Member;

public interface ChatService {
	
	// 사원 조회용 서비스(select)
	ArrayList<Member> selectDept();
	ArrayList<Member> selectMember();

}
