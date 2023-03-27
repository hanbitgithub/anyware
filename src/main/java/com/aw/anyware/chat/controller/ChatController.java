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
import com.google.gson.Gson;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
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

}
