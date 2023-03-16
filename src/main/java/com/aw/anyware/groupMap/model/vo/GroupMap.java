package com.aw.anyware.groupMap.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class GroupMap {

	private int memberNo;
	private String deptName; 
	private String jobName; // 직급(사원, 대리, 과장...)
	private String position; //직책(팀원, 팀장)
	private String duty;
	private String name;
	private String memberId;
	private String memberPwd;
	private String rrn; // 주민등록번호
	private String email;
	private String phone;
	private String address;
	private String status;
	private String enrollDate;
	private String outDate;
	private int leaveOff; // 총연차개수
	private String profileUrl; // 프로필 사진 수정본 경로
	
	private String updatePwd; // 사용자가 변경하려고 입력한 비밀번호
	private String encPwd; // 비밀번호 변경 기능을 통해 암호화된 비밀번호

}
