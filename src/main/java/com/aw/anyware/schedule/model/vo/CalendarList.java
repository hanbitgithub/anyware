package com.aw.anyware.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 내 캘린더 목록
 * */

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CalendarList {
	
    private String calendarNo;
    private String myCalendar;
    private String scColor;
    private String memberNo;
    
}