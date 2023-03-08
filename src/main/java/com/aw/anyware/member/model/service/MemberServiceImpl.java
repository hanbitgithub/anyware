package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;
import com.aw.anyware.member.model.dao.MemberDao;
import com.aw.anyware.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Member> selectAllMember() {
		
		return mDao.selectAllMember(sqlSession);
	}

	@Override
	public int selectListCount() {
		
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(sqlSession, m);
	}
	
	

}
