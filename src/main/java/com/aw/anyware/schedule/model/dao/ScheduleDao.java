package com.aw.anyware.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	/** 새 일정 추가
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int addScheduleModal(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("scheduleMapper.addScheduleModal", s);
	}
	
	/** 내 캘린더 추가
	 * @param sqlSession
	 * @param c
	 * @return
	 */
	public int addCalendarModal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("scheduleMapper.addCalendarModal", c);
	}
	
	/** 내 캘린더 목록
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Calendar> calendarList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.calendarList", memberNo);
	}
	
	/** 내 캘린더 수정 화면
	 * @param sqlSession
	 * @param calendar
	 * @return
	 */
	public Calendar calendarModifyModal(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.selectOne("scheduleMapper.calendarModifyModal", c);
	}
	
	/** 내 캘린더 수정
	 * @param sqlSession
	 * @param calendarVo
	 * @return
	 */
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("scheduleMapper.updateCalendar", c);
	}
	
	/** 내 캘린더 삭제
	 * @param sqlSession
	 * @param c
	 * @return
	 */
	public int deleteCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.delete("scheduleMapper.deleteCalendar", c);
	}
	
	/** 스케줄 목록 조회 
	 * @param sqlSession
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Schedule> scheduleList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.scheduleList", memberNo);
	}
	
	/** 스케줄 상세 조회
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public ArrayList<Schedule> detailScheduleList(SqlSessionTemplate sqlSession, Schedule s) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.detailScheduleList", s);
	}
	
	/** 캘린더 삭제시 일정 삭제
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int aaa(SqlSessionTemplate sqlSession, Schedule s) {
		System.out.println("cccccccc dao ::" + s);
		return sqlSession.delete("scheduleMapper.aaa", s);
	}
	
	/** 스케줄 상세 조회 수정
	 * @param sqlSession
	 * @param s
	 * @return
	 */
	public int updateScheduleModal(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("scheduleMapper.updateScheduleModal", s);
	}
	
	
	
	
	
	
	
	
	/** 키워드 검색
	 * @param sqlSession
	 * @param keyword
	 * @return
	 */
	public ArrayList<Schedule> searchKeyword(SqlSessionTemplate sqlSession, Schedule s) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.searchKeyword", s);
	}

	
	
	
	
	
	
	

	
}
