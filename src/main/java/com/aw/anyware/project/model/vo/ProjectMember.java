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
public class ProjectMember {
	
	private int projectNo;
	private int memberNo;
	private String status;
	private String enrollDate;

}
