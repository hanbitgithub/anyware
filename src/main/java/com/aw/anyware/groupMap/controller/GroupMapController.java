package com.aw.anyware.groupMap.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.board.model.vo.Reply;
import com.aw.anyware.groupMap.model.service.GroupMapService;
import com.aw.anyware.groupMap.model.vo.GroupMap;
import com.google.gson.Gson;


@Controller
public class GroupMapController {

	@Autowired
	private GroupMapService gService;
	
	@RequestMapping("list.grp")
	public String mainpage() {
		return "board/groupMap";
	}
	
	
	@RequestMapping("list.gr")
	public String selectMemberList(Model model) {
		
		ArrayList<GroupMap> list = gService.selectMemberList();
		
		model.addAttribute("list", list);
		
		return "board/groupMap";
		
		
		
	}
	/*
	@ResponseBody
	@RequestMapping(value="list.grp", produces="application/json; charset=utf-8")
	public String selectMemberList() {
		
		ArrayList<GroupMap> list = gService.selectMemberList();
		return new Gson().toJson(list);
	}*/

	@ResponseBody
	@RequestMapping(value="modallist.gr", produces="aplication/json; charset=utf-8")
	public String ajaxSelectMemberList(int no) {
		
		ArrayList<GroupMap> list = gService.ajaxSelectMemberList(no);
		return new Gson().toJson(list);
	}
}
