package com.aw.anyware.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private int postNo;
	private int memberNo;
	private String replyContent;
	private String createDate;
	private String status;
	
	private String name;
	private String jobName;
}
