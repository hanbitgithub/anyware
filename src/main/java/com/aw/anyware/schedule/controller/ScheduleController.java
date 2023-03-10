package com.aw.anyware.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aw.anyware.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
	/*
	 * @Autowired private ScheduleService scService;
	 */
	
	@RequestMapping("main.sc")
	public String main() {
		return "schedule/scheduleMain";
	}
	
	

}
