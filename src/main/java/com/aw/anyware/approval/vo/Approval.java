package com.aw.anyware.approval.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Approval {
	
	private int apporNo;
	private int memberNo;
	private int tlpNo;
	private String approTitle;
	private String approContent;
	private int interNo;
	private String interAppro;
	private int finalNo;
	private String finalAppro;
	private String createDate;
	
}
