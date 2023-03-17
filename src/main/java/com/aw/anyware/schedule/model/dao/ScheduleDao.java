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
	
	// 내 캘린더 목록
	public ArrayList<Calendar> calendarList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.calendarList", memberNo);
	}
	

	
}
