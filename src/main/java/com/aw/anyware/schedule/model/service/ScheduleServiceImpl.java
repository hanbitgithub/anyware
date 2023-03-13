package com.aw.anyware.schedule.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.schedule.model.dao.ScheduleDao;
import com.aw.anyware.schedule.model.vo.CalendarModalSave;
import com.aw.anyware.schedule.model.vo.CalendarVo;
import com.aw.anyware.schedule.model.vo.ScheduleModalSave;


@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scheduleDao;

	// 새 일정 추가
	@Override
	public int scheduleModalSave(ScheduleModalSave scheduleModalSave) {
		return scheduleDao.scheduleModalSave(sqlSession, scheduleModalSave);
	}

	// 내 캘린더 추가
	@Override
	public int calendarModalSave(CalendarModalSave calendarModalSave) {
		return scheduleDao.calendarModalSave(sqlSession, calendarModalSave);
	}

	// 내 캘린더 목록
	@Override
	public List<CalendarVo> calendarList(int memberNo) {
		return scheduleDao.calendarList(sqlSession, memberNo);
	}
	
	// 내 캘린더 수정 화면
	@Override
	public CalendarVo calendarModify(CalendarVo calendarVo) {
		return scheduleDao.calendarModify(sqlSession, calendarVo);
	}

	@Override
	public int updateCalendar(CalendarVo calendarVo) {
		return scheduleDao.updateCalendar(sqlSession, calendarVo);
	}

}
