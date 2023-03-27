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
public class ChatRoom {
	
	private int chatroomNo;
	private String chatTitle;
	private int chatType;
	private String createDate;
	
	private int notRead;
	private String chatContent;
	private String sendDate;

}
