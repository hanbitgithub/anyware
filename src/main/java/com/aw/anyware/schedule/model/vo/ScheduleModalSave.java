package com.aw.anyware.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 새 일정 추가
 * */

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ScheduleModalSave {
	
	private String calendarNo;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String allday;
	private String scTitle;
	private String scContent;
	private String writeDate;	// 등록날짜

}
