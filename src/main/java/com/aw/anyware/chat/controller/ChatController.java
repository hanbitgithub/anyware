package com.aw.anyware.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.chat.model.service.ChatService;
import com.aw.anyware.chat.model.vo.ChatContent;
import com.aw.anyware.chat.model.vo.Thumbnail;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.service.ProjectService;
import com.google.gson.Gson;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private ProjectService pService;
	
	@ResponseBody
	@RequestMapping(value="chattingList.ajax", produces="application/json; charset=UTF-8")
	public String selectChattingList(int memberNo) {
		ArrayList<Thumbnail> rList = cService.selectChatRoomList(memberNo);
		return new Gson().toJson(rList);
	}
	
	@ResponseBody
	@RequestMapping(value="chattingRoom.ajax", produces="application/json; charset=UTF-8")
	public String chattingRoomEntry(int roomNo, int myNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("myNo", myNo);
		
		ArrayList<ChatContent> chList = new ArrayList<>();
		
		int result = cService.updateCount(map);
		if(result > 0) {
			chList = cService.selectChatContentList(roomNo);
		}
		
		return new Gson().toJson(chList);
	}
	
	@ResponseBody
	@RequestMapping(value="chatAddress.ajax", produces="application/json; charset=UTF-8")
	public String selectChatAddress() {
		ArrayList<Member> dList = pService.selectDeptList();
		ArrayList<Member> mList = pService.selectMemberList();
		
		HashMap<String, ArrayList<Member>> map = new HashMap<>();
		map.put("dList", dList);
		map.put("mList", mList);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="createRoom.ajax", produces="application/json; charset=UTF-8")
	public String createRoom(Thumbnail th) {
		HashMap<String, Object> map = new HashMap<>();
		map = cService.insertRoom(th);
		
		return "";
	}

}
