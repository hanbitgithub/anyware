package com.aw.anyware.groupMap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aw.anyware.groupMap.model.service.GroupMapService;


@Controller
public class GroupMapController {

	@Autowired
	private GroupMapService gService;
	
	@RequestMapping("groupmap.bo")
	public String mainpage() {
		return "board/groupMap";
	}
}
