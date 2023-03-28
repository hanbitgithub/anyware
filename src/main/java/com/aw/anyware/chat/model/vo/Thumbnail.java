package com.aw.anyware.chat.model.vo;

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
public class Thumbnail {
	
	private int contentNo;
	private int roomNo;
	private int writerNo;
	private String writerName;
	private String content;
	private String sendDate;
	private String originName;
	private String changeName;
	
	private int notRead;
	private String sendTime;
	private String profileUrl;
	private String deptName;
	private String jobName;
	
	private String otherNo;
	private String otherName;
	private String title;
	private int lcheck;

}
