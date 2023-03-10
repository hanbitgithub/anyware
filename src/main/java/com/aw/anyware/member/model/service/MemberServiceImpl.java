package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.dao.MemberDao;
import com.aw.anyware.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Member> selectAllMember(PageInfo pi) {
		
		return mDao.selectAllMember(sqlSession, pi);
	}
	
	@Override
	public Member detailAllMember(int memberNo) {
		
		return mDao.detailAllMember(sqlSession, memberNo);
	}
	
	@Override
	public Member loginUserRrn(int memberNo) {
		
		return mDao.loginUserRrn(sqlSession, memberNo);
	}

	@Override
	public int selectListCount() {
		
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public Member selectPwd(Member m) {
		
		return mDao.selectPwd(sqlSession, m);
	}

	@Override
	public int changePwd(Member m) {
		
		return mDao.changePwd(sqlSession, m);
	}

	

	
	
	

}
