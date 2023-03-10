package com.aw.anyware.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.service.MemberService;
import com.aw.anyware.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired 
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	
	
	
	
	@RequestMapping("main.do")
	public String mainPage() {
		return "main";
	}
		
	@RequestMapping("selectAll.me")
	public String selectAllMember(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									String deptName, Model model, HttpSession session) {
		System.out.println("페이지 : " + currentPage);
		System.out.println(deptName);
		if(deptName.equals("인사부")) {
			
			int listCount = mService.selectListCount();
			System.out.println("listCount : " + listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
			ArrayList<Member> list = mService.selectAllMember(pi);
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
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		System.out.println("m.getMemberPwd :" + m.getMemberPwd());
		System.out.println("loginUser.getMemberPwd :" + loginUser.getMemberPwd());
		if(loginUser == null) {
			mv.addObject("errorMsg", "로그인에 실패하였습니다");
			mv.setViewName("common/errorPage");
			
		}else {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		}
				
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("memberUpdate.me")
	public ModelAndView memberUpdate(ModelAndView mv) {
		mv.setViewName("member/memberPersonalInfo");
		return mv;
	}
	
	@RequestMapping("changePwd.me") //성공시 알람 필요, 비밀번호 변경 후 재변경 기능 추가?
	public String changePwd(Member m, Model model, HttpSession session) {
		System.out.println(m);
		Member memberPwd = mService.selectPwd(m);
		
		if(memberPwd != null) {
			/*
			String newMemberPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
			String encPwd = bcryptPasswordEncoder.encode(newMemberPwd);
			m.setEncPwd(encPwd);
			int result = mService.changePwd(m);
			System.out.println("왔나?");
			*/
			String encPwd = bcryptPasswordEncoder.encode(m.getUpdatePwd());
			m.setEncPwd(encPwd);
			int result = mService.changePwd(m);
			System.out.println("m :" + m);
			if(result > 0) {
				model.addAttribute("alertMsg", "비밀번호 변경에 성공하였습니다");
				return "member/memberPersonalInfo";
			}else {
				model.addAttribute("errorMsg", "비밀번호 변경에 실패했습니다");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("errorMsg", "비밀번호를 정확히 입력해주세요");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detailAllMember.me")
	public ModelAndView detailAllMember(int memberNo, ModelAndView mv, HttpSession session) {
		System.out.println("memberNo : " + memberNo);
		Member m = mService.detailAllMember(memberNo);
		System.out.println("m: " + m);
		int loginMemberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		System.out.println("loginMemberNo : " + loginMemberNo);
		if(memberNo == loginMemberNo) {
			Member loginUserRrn = mService.loginUserRrn(memberNo);
			System.out.println("loginUserRrn.getRrn : " + loginUserRrn.getRrn());
			m.setRrn(loginUserRrn.getRrn());
			System.out.println("setRrn : " + m.getRrn());
			mv.addObject(m).setViewName("member/detailAllMember");
			return mv;
		}else {
			mv.addObject(m).setViewName("member/detailAllMember");
			return mv;
		}
	}
	

}