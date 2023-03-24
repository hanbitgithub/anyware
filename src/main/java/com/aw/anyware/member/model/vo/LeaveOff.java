package com.aw.anyware.member.model.vo;

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
public class LeaveOff {

	
	private int dayoffNo;
	private String name;
	private String applyDate;
	private String cancelDate;
	private String status;
	private int apNo;
	private String offDate;
}
