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
public class Project {
	
	private int projectNo;
	private String owner;
	private String projectTitle;
	private String projectContent;
	private String publicStatus;
	private String createDate;
	private String status;
	
	private String like;

}
