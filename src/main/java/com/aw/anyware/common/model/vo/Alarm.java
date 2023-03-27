package com.aw.anyware.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Alarm {

	private String alNo;
	private String alMno;
	private String alBno;
	private String alCno;
	private String alDate;
	private String alReadDate;
	private int alCount;
	private String alContent;
	
}
