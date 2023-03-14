package com.aw.anyware.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PjSchedule {
	
	private int scheduleNo;
	private int projectNo;
	private String scheduleName;
	private String beginDate;
	private String endDate;
	private String scheduleWriter;
	private String color;

}
