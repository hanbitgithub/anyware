package com.aw.anyware.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.member.model.vo.Commute;
import com.aw.anyware.member.model.vo.LeaveOff;
import com.aw.anyware.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		 int limit = pi.getBoardLimit();
		 RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember", null, rowBounds);
		
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public Member selectPwd(SqlSessionTemplate sqlSession, Member m) {
		Member a = sqlSession.selectOne("memberMapper.selectPwd", m);
		System.out.println("a : " + a);
		return a;
			
	}
	
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.changePwd", m);
	}

	public Member detailAllMember(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.detailAllMember", memberNo);
	}

	public Member loginUserRrn(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.loginUserRrn", memberNo);
	}

	public int memberPersonalUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.memberPersonalUpdate", m);
	}
	
	public int allMemberUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.allMemberUpdate", m);
	}
	/*
	public int enrollMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.enrollMember", m);
	}

	public Member selectDayOff(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.selectDayOff", m);
	}
	*/

	public int insertCommute(SqlSessionTemplate sqlSession, Commute c) {
		
		return sqlSession.update("memberMapper.insertCommute", c);
		
	}

	public int commuteOut(SqlSessionTemplate sqlSession, Commute c) {
		
		return sqlSession.update("memberMapper.commuteOut", c);
	}

	public Commute selectCommute(SqlSessionTemplate sqlSession, Commute c) {
		
		return sqlSession.selectOne("memberMapper.selectCommute", c);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int outMember(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.update("memberMapper.outMember", memberNo);
	}

	public int selectListCountOut(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectListCountOut");
	}

	public ArrayList<Member> selectOutMember(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		 int limit = pi.getBoardLimit();
		 RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectOutMember", null, rowBounds);
	}

	public Member searchPwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.searchPwd",m);
	}

	public int makeNewPwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.makeNewPwd", m);
	}

	public LeaveOff selectLastOff(SqlSessionTemplate sqlSession, LeaveOff lo) {
		
		return sqlSession.selectOne("memberMapper.selectLastOff", lo);
	}

	
	public ArrayList<Commute> selectMemberAttendenceList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberAttendenceList",memberNo);
		
	}
	
	public Commute selectTodayCommute(SqlSessionTemplate sqlSession, int memNo) {	
		return sqlSession.selectOne("memberMapper.selectTodayCommute", memNo);
	}
	
	public double selectMonthCommute(SqlSessionTemplate sqlSession,int memNo ) {
		return sqlSession.selectOne("memberMapper.selectMonthCommute", memNo);
	}
	
	public double selectWeeklyCommute(SqlSessionTemplate sqlSession,int memNo ) {
		return sqlSession.selectOne("memberMapper.selectWeeklyCommute", memNo);
	}
	
	public String selectToday(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectToday");
	}

	public int insertOff(SqlSessionTemplate sqlSession, LeaveOff lo) {
		
		return sqlSession.insert("memberMapper.insertOff", lo);
	}

	public ArrayList<LeaveOff> selectMyOff(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyOff", memberNo);
	}

	public int cancelOff(SqlSessionTemplate sqlSession, LeaveOff lo) {
		
		return sqlSession.update("memberMapper.cancelOff", lo);
	}

	public int newCommute(SqlSessionTemplate sqlSession, Member nn) {
		
		return sqlSession.insert("memberMapper.newCommute", nn);
	}

	public Member selectMN(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.selectMN", m);
	}

	public ArrayList<Member> selectNN(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectNN");
	}
	
}
