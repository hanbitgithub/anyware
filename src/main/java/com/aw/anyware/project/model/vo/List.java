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
public class List {
	
	private int listNo;
	private int projectNo;
	private int memberNo;
	private String listTitle;
	private String beginDate;
	private String endDate;
	private String color;
	private String enrollDate;

}
