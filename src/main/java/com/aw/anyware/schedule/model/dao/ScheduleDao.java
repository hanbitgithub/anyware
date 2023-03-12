package com.aw.anyware.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.aw.anyware.schedule.model.vo.CalendarModalSave;
import com.aw.anyware.schedule.model.vo.CalendarVo;
import com.aw.anyware.schedule.model.vo.ScheduleModalSave;

@Repository
public class ScheduleDao {

	// 새 일정 추가
	public int scheduleModalSave(SqlSessionTemplate sqlSession, ScheduleModalSave scheduleModalSave) {
		return sqlSession.insert("scheduleMapper.scheduleModalSave", scheduleModalSave);
	}

	// 내 캘린더 추가
	public int calendarModalSave(SqlSessionTemplate sqlSession, CalendarModalSave calendarModalSave) {
		return sqlSession.insert("scheduleMapper.calendarModalSave", calendarModalSave);
	}

	// 내 캘린더 목록
	public List<CalendarVo> calendarList(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("scheduleMapper.calendarList", memberNo);
	}
	
	// 내 캘린더 수정 화면
	public CalendarVo calendarModify(SqlSessionTemplate sqlSession, CalendarVo calendarVo) {
		return sqlSession.selectOne("scheduleMapper.calendarModify",calendarVo);
	}

	// 내 캘린더 수정
	public int updateCalendar(SqlSessionTemplate sqlSession, CalendarVo calendarVo) {
		return sqlSession.update("scheduleMapper.updateCalendar", calendarVo);
	}
}
