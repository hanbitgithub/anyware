package com.aw.anyware.board.model.vo;

import java.sql.Date;

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
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String originName;
	private String changeName;
	private Date createDate;
	private int count;
	private String status;
	private int category;

}
