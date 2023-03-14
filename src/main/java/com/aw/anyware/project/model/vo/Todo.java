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
public class Todo {
	
	private int todoNo;
	private int listNo;
	private int memberNo;
	private String todoTitle;
	private String finishStatus;
	private String enrollDate;
}
