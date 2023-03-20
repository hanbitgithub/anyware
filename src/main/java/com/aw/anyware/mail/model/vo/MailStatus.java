package com.aw.anyware.mail.model.vo;

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
public class MailStatus {	

	private String emNo;
	private String emType;
	private String receiverName;
	private String receiver;
	private String read;
	private String readTime;
	private String important;
	private String trash;
	private String spam;
	private String tempSave;
	private String emTypes;

	
	private String box;
	private String sender;

	
	
}
