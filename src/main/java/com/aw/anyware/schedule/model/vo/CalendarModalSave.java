package com.aw.anyware.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 내 캘린더 추가
 * */

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class CalendarModalSave {
	
	private String myCalendar;
	private String scColor;
	private String memberNo;
}
