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
public class MailFile {
	
	private int emfNo;
	private int emNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	private String fileSize;
	

}
