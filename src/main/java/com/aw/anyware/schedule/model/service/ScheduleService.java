package com.aw.anyware.schedule.model.service;

import java.util.List;

import com.aw.anyware.schedule.model.vo.CalendarList;
import com.aw.anyware.schedule.model.vo.CalendarModalSave;
import com.aw.anyware.schedule.model.vo.ScheduleModalSave;

public interface ScheduleService {

	// 새 일정 추가
	int scheduleModalSave(ScheduleModalSave scheduleModalSave);

	// 내 캘린더 추가
	int calendarModalSave(CalendarModalSave calendarModalSave);

	// 내 캘린더 목록
	List<CalendarList> calendarList(int menberNo);


}
