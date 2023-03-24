package com.aw.anyware.project.model.vo;

import java.util.ArrayList;

import com.aw.anyware.member.model.vo.Member;

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
public class ListChat {
	
	private int chatNo;
	private int listNo;
	private int writerNo;
	private String chatContent;
	private String originName;
	private String changeName;
	private String sendDate;
	private String sendTime;
	private String name;
	private String deptName;
	private String jobName;
	private String profileUrl;
	
	private ArrayList<ListChat> chatInfo;

}
