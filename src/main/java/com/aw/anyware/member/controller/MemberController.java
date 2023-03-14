package com.aw.anyware.member.controller;

import java.time.LocalDateTime;
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
		
		if(deptName.equals("인사부")) {
			
			int listCount = mService.selectListCount();
			
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
		
		Member m = mService.detailAllMember(memberNo);
		
		int loginMemberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		if(memberNo == loginMemberNo) {
			Member loginUserRrn = mService.loginUserRrn(memberNo);
			
			m.setRrn(loginUserRrn.getRrn());
			
			mv.addObject("m", m).setViewName("member/detailAllMember");
			
			return mv;
		}else {
			mv.addObject("m", m).setViewName("member/detailAllMember");
			
			return mv;
		}
	}
	
	@RequestMapping("memberPersonalUpdate")
	public String memberPersonalUpdate(Member m, Model model, HttpSession session) {
		int result = mService.memberPersonalUpdate(m);
		
		if(result > 0) {
			
			Member updateMem = mService.loginMember(m);
			
			session.setAttribute("alertMsg", "정보 변경에 성공했습니다");
			session.setAttribute("loginUser", updateMem);
			return "member/memberPersonalInfo";
		}else {
			model.addAttribute("errorMsg", "정보 변경에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("allMemberUpdate")
	public ModelAndView allMemberUpdate(Member m, ModelAndView mv, HttpSession session) {
		
		int result = mService.allMemberUpdate(m);
		
		if(result > 0) {
			System.out.println("m : " + m);
			Member updateMem = mService.loginMember(m);
			System.out.println("updateMem : " + updateMem);
			session.setAttribute("alertMsg", "정보 변경에 성공했습니다");
			mv.addObject("m", updateMem);
			mv.setViewName("member/detailAllMember");
			return mv;
		}else {
			mv.addObject("errorMsg", "정보변경에 실패하였습니다");
			mv.setViewName("common/errorPage");
			return mv;
		}
	}
	/*
	@RequestMapping("enrollMember.me")
	public String enrollMember(Member m) {
		LocalDateTime standardTime = LocalDateTime.parse("2023-03-14T09:01:00.000");
	}
	*/

}