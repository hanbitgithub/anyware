package com.aw.anyware.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String originName;
	private String changeName;
	private String createDate;
	private int count;
	private String status;
	private int category;
	
	private String name;
	private String jobName;
}
