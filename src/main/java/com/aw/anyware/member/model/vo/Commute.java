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
public class Commute {
	
	
	
	private int commuteNo;
	private String name;
	private String commuteIn;
	private String commuteOut;
	private String commuteDate;
	private int memberNo;
	private String commuteStatus;
	
	private String commuteTime;

}
