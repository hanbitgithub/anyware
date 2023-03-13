package com.aw.anyware.schedule.model.service;

import java.util.List;

import com.aw.anyware.schedule.model.vo.CalendarModalSave;
import com.aw.anyware.schedule.model.vo.CalendarVo;
import com.aw.anyware.schedule.model.vo.ScheduleModalSave;

public interface ScheduleService {

	// 새 일정 추가
	int scheduleModalSave(ScheduleModalSave scheduleModalSave);

	// 내 캘린더 추가
	int calendarModalSave(CalendarModalSave calendarModalSave);

	// 내 캘린더 목록
	List<CalendarVo> calendarList(int menberNo);

	// 내 캘린더 수정 화면
	CalendarVo calendarModify(CalendarVo calendarVo);

	// 내 캘린더 수정
	int updateCalendar(CalendarVo calendarVo);
}
