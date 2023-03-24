package com.aw.anyware.common.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.aw.anyware.member.model.service.MemberService;

@Component
public class Scheduler {
	
	@Autowired
	private MemberService mbService;
	
	@Scheduled(cron="0 0 0 * * MON-FRI")// 월~금(평일) 00시 정각마다 실행 
	public void completeDelteReply() {
		//평일 00시 정각마다 사원들의 근태 추가 
		int result = mbService.insertMemberCommuteIn();
		// 자동으로 실행되기때문에 응답페이지나 리턴할 필요없음
		
		System.out.println(result);
		
		
	}
	
	
	
	
}
