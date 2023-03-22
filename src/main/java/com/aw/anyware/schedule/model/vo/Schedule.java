package com.aw.anyware.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Schedule {
	
	private int scheduleNo;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String scTitle;
	private String scContent;
	private String status;
	private String writeDate;
	private int memberNo;
	private int calendarNo;
	private String allday;
	
	private String scColor;

}
