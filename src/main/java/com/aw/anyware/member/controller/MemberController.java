package com.aw.anyware.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.service.MemberService;
import com.aw.anyware.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired 
	private MemberService mService;
	
		
	@RequestMapping("selectAll.me")
	public String selectAllMember(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									String deptName, Model model, HttpSession session) {
		
		if(deptName.equals("인사부")) {
			
			int listCount = mService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Member> list = mService.selectAllMember();
			if(list != null) {
				model.addAttribute("pi",pi);
				model.addAttribute("list",list);
				return "member/selectAllMember";
			}else {
				model.addAttribute("errorMsg", "정보를 불러오지 못하였습니다");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("errorMsg", "접근 권한이 없습니다");
			return "common/errorPage";
		}
	}

}