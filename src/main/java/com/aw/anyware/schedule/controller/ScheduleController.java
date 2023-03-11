package com.aw.anyware.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.schedule.model.service.ScheduleService;
import com.aw.anyware.schedule.model.vo.CalendarList;
import com.aw.anyware.schedule.model.vo.CalendarModalSave;
import com.aw.anyware.schedule.model.vo.ScheduleModalSave;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("main.sc")
	public String main(HttpSession session, Model model) {
		return "schedule/scheduleMain";
	}
	
	// 새 일정 추가
	@RequestMapping("scheduleModalSave.sc")
	@ResponseBody
	public int scheduleModalSave(ScheduleModalSave scheduleModalSave) {
		return scheduleService.scheduleModalSave(scheduleModalSave);
	}
	
	// 내 캘린더 추가
	@RequestMapping("calendarModalSave.sc")
	@ResponseBody
	public int calendarModalSave(CalendarModalSave calendarModalSave) {
		return scheduleService.calendarModalSave(calendarModalSave);
	}
	
	// 내 캘린더 목록
	@RequestMapping("calendarList.sc")
	@ResponseBody
	public List<CalendarList> calendarList(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		List<CalendarList> aa = scheduleService.calendarList(memberNo);
		return scheduleService.calendarList(memberNo);
	}
	
}
