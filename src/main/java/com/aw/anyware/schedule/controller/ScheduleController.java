package com.aw.anyware.schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.schedule.model.service.ScheduleService;
import com.aw.anyware.schedule.model.vo.Calendar;
import com.aw.anyware.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired(required=true)
	private ScheduleService scService;
	
	// 일정 메인페이지
	@RequestMapping("schedule.sc")
	public String scheduleMain(HttpSession session) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		return "schedule/scheduleMain";
	}
	
	// 새 일정 추가
	@ResponseBody
	@RequestMapping("addScheduleModal.sc")
	public String ajaxAddScheduleModal(Schedule s, HttpSession session) {
		s.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = scService.addScheduleModal(s);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 추가
	@ResponseBody
	@RequestMapping("addCalendarModal.sc")
	public String ajaxAddScheduleModal(Calendar c, HttpSession session) {
		c.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = scService.addCalendarModal(c);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 목록
	@RequestMapping("calendarList.sc")
	@ResponseBody
	public ArrayList<Calendar> calendarList(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Calendar> list = scService.calendarList(memberNo);
		return list;
	}
	
	
	
	
}
