package com.aw.anyware.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.dao.MemberDao;
import com.aw.anyware.member.model.vo.Commute;
import com.aw.anyware.member.model.vo.LeaveOff;
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

	@Override
	public int memberPersonalUpdate(Member m) {
		
		return mDao.memberPersonalUpdate(sqlSession, m);
	}

	@Override
	public int allMemberUpdate(Member m) {
		
		return mDao.allMemberUpdate(sqlSession, m);
	}
	
	@Override
	public int insertCommute(Commute c) {
		
		return mDao.insertCommute(sqlSession, c);
	}

	@Override
	public int commuteOut(Commute c) {
		
		return mDao.commuteOut(sqlSession, c);
	}

	@Override
	public Commute selectCommute(Commute c) {
		
		return mDao.selectCommute(sqlSession, c);
	}
	
	@Override
	public String selectToday() {
		
		return mDao.selectToday(sqlSession);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int outMember(int memberNo) {
		
		return mDao.outMember(sqlSession, memberNo);
	}

	@Override
	public int selectListCountOut() {
		
		return mDao.selectListCountOut(sqlSession);
	}

	@Override
	public ArrayList<Member> selectOutMember(PageInfo pi) {
		
		return mDao.selectOutMember(sqlSession, pi);
	}

	@Override
	public Member searchPwd(Member m) {
		
		return mDao.searchPwd(sqlSession, m);
	}

	@Override
	public int makeNewPwd(Member m) {
		
		return mDao.makeNewPwd(sqlSession, m);
	}
	
	@Override
	public ArrayList<Commute> selectMemberAttendenceList(int memberNo) {
		return mDao.selectMemberAttendenceList(sqlSession,memberNo);
	}	
	@Override
	public Commute selectTodayCommute(int memNo) {
		return mDao.selectTodayCommute(sqlSession, memNo);
	}
	
	
	
   @Override
	public LeaveOff selectLastOff(LeaveOff lo) {
		
		return mDao.selectLastOff(sqlSession, lo);
	}
   
   @Override
	public int insertOff(LeaveOff lo) {
		
		return mDao.insertOff(sqlSession);
	}
   
	@Override
	public double selectWeeklyCommute(int memNo) {
		return mDao.selectWeeklyCommute(sqlSession, memNo);
	}
	
	@Override
	public double selectMonthCommute(int memNo) {
		return mDao.selectMonthCommute(sqlSession, memNo);
	}

	
	


	

	
	

	
	
	

}
