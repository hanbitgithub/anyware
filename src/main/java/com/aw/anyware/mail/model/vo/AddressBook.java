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
public class AddressBook {
	
	private int addNo;
	private String name;
	private String deptName;
	private String jobName;
	private String email;
	private String phone;
	private String bizName;
	private String status;
	private String groupNo;
	private String memNo;
	
	private String groupName;
	

}
