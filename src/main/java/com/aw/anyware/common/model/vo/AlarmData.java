package com.aw.anyware.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class AlarmData {

	private String cmd;
	private String emNo;
	private String mailWriter;
	private String mailTitle;
	private String currentMem;
	private String alContent;
	
}
