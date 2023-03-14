package com.aw.anyware.mail.model.vo;

import java.util.ArrayList;

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
public class Mail {

	private int emNo;
	private String emTitle;
	private String emContent;
	private String memName; //보낸사람이름
	private String sender;  //보낸사람 이메일 
	private String receivers;
	private String refEmail;
	private String sendDate;
	private String tempStock;	
	private String tempDate;
	private String emfNo;
	
	private MailStatus mailStatus;
	private ArrayList<MailFile> fileList;
}
