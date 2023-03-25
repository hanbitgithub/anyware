package com.aw.anyware.member.model.vo;

import java.util.Date;



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
public class Member {
	
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
	private String detailAddress; // 신규사원 등록시 필요한 항목
	private String extraAddress; // 신규사원 등록시 필요한 항목
	private String status;
	private String enrollDate;
	private String outDate;
	private int leaveOff; // 총연차개수
	private String profileUrl; // 프로필 사진 수정본 경로
	
	private String updatePwd; // 사용자가 변경하려고 입력한 비밀번호
	private String encPwd; // 비밀번호 변경 기능을 통해 암호화된 비밀번호
	private String enrollTime; // 사용자가 출근한 시간
	private String birthday;
	private String jobCode;
	
	private String newPwd; // 비밀번호 찾기
	private String checkPwd; // 비밀번호 찾기
	
	private String offDate; // 연차 날짜
	
	private String commuteIn;
	private String commuteOut;

}




