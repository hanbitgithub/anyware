package com.aw.anyware.schedule.model.service;

import java.util.ArrayList;

import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 새 일정 추가
	int addScheduleModal(Schedule s);

	// 내 캘린더 추가
	int addCalendarModal(Calendar c);
	
	// 내 캘린더 목록 조회
	ArrayList<Calendar> calendarList(int memberNo);
	
	// 내 캘린더 수정 화면
	Calendar calendarModifyModal(Calendar c);
	
	// 내 캘린더 수정
	int updateCalendar(Calendar c);
	
	// 내 캘린더 삭제
	int deleteCalendar(Calendar c);
	
	// 스케줄 목록 조회
	ArrayList<Schedule> scheduleList(int memberNo);
	
	
	
	
}
