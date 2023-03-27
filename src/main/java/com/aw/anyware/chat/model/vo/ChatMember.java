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
public class ChatMember {
	
	private int chatroomNo;
	private int memberNo;
	private String enrollDate;
	private int notRead;

}
