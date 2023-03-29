package com.aw.anyware.common.scheduler;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.aw.anyware.member.model.service.MemberService;
import com.aw.anyware.member.model.vo.Member;


@Component
public class Scheduler {
	
	@Autowired
	private MemberService mService;
	
	@Scheduled(cron="0 0 0 * * MON-FRI") 
	public void newCommute() {
		ArrayList<Member> list = mService.selectNN();
		System.out.println(list);
		for(Member nn : list) {
			
			int result = mService.newCommute(nn);
			
		}
		
		
	}

}
