package com.aw.anyware.member.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
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
import com.aw.anyware.member.CrunchifyJavaMailExample;
import com.aw.anyware.member.model.service.MemberService;
import com.aw.anyware.member.model.vo.Commute;
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
			if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);
			
			
			mv.setViewName("main");
		}else {
			mv.addObject("errorMsg", "아이디 또는 비밀번호를 확인해주세요");
			mv.setViewName("common/errorPage");
		}
			}									
		return mv;
	}
	
	/*
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
	*/
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
	/*
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
	*/
	
	@RequestMapping("changePwd.me")
	public String changePwd2(Member m, Model model, HttpSession session) {
		String mPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
		System.out.println("mPwd : " + mPwd);
		if(mPwd != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), mPwd)) {
			String encPwd = bcryptPasswordEncoder.encode(m.getUpdatePwd());
			
			m.setEncPwd(encPwd);
			
			int result = mService.changePwd(m);
			
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
		
		
		
		if(m != null) {												
			mv.addObject("m", m).setViewName("member/detailAllMember");
			
			return mv;
		}else {
			mv.addObject("errorMsg", "조회 실패").setViewName("main");
			
			return mv;
		}
	}
	
	@RequestMapping("memberPersonalUpdate.me")
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
			
			Member updateMem = mService.loginMember(m);
			
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
	
	@RequestMapping("commuteIn.me")
	public ModelAndView enrollMember(Commute c, ModelAndView mv, HttpSession session) {
		
		int result = mService.insertCommute(c);
		if(result > 0) {
			Commute cTime = mService.selectCommute(c);
			
			mv.addObject("commute", cTime);
			mv.addObject("alertMsg", "출근하였습니다");
			mv.setViewName("main");
			return mv;
		}else {
			mv.addObject("errorMsg", "다시 시도해주십시오");
			mv.setViewName("main");
			return mv;
		}
		
	}
	
	@RequestMapping("commuteOut.me")
	public ModelAndView commuteOut(Commute c, ModelAndView mv, HttpSession session) {
		int result = mService.commuteOut(c);
		if(result > 0) {
			Commute cTime = mService.selectCommute(c);
			
			mv.addObject("commute", cTime);
			mv.addObject("alertMsg", "퇴근하였습니다");
			mv.setViewName("main");
			return mv;
		}else {
			mv.addObject("errorMsg", "다시 시도해주십시오");
			mv.setViewName("main");
			return mv;
		}
	}
	
	@RequestMapping("regist.me")
	public ModelAndView regist(ModelAndView mv) {
		mv.setViewName("member/registNewMember");
		return mv;
	}
	
	@RequestMapping("insert.me")
	public ModelAndView insertMember(Member m, ModelAndView mv) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		
		int result = mService.insertMember(m);
		if(result > 0) {
			mv.addObject("alertMsg", "신규 사원을 추가하였습니다");
			mv.setViewName("member/selectAllMember");
			return mv;
		}else {
			mv.addObject("errorMsg", "다시 시도해주십시오");
			mv.setViewName("member/selectAllMember");
			return mv;
		}
	}
	
	@RequestMapping("leaveOff.me")
	public ModelAndView leaveOff(ModelAndView mv) {
		mv.setViewName("member/leaveOff");
		return mv;
	}
	
	@RequestMapping("outMember.me") // 전체사원조회 페이지로 재요청???
	public ModelAndView outMember(int memberNo, ModelAndView mv) {
		int result = mService.outMember(memberNo);
		
		if(result > 0) {
			mv.addObject("alertMsg", "퇴사처리 되었습니다").setViewName("main");
			return mv;			
		}else {
			mv.addObject("errorMsg", "퇴사처리에 실패하였습니다").setViewName("common.errorPage");
			return mv;
		}
	}
	
	@RequestMapping("selectOut.me")	
	public String selectOut(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									String deptName, Model model, HttpSession session) {
		
		if(deptName.equals("인사부")) {
			
			int listCount = mService.selectListCountOut();
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
			ArrayList<Member> list = mService.selectOutMember(pi);
			
			if(list != null) {
				model.addAttribute("pi",pi);
				model.addAttribute("list",list);
				return "member/selectOutMember";
			}else {
				model.addAttribute("errorMsg", "정보를 불러오지 못하였습니다");
				return "common/errorPage";
			}
		}else {
			model.addAttribute("errorMsg", "접근 권한이 없습니다");
			return "common/errorPage";
		}
		
	}
	/*
	@RequestMapping("mailTest.me")	
	public void mailTest(String email) {
		
		try {
			CrunchifyJavaMailExample.generateAndSendEmail(email);
		} catch (AddressException e) {
			
			e.printStackTrace();
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
	}
	*/
	@RequestMapping("findId.me")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("member/findId");
		return mv;
	}
	
	@RequestMapping("searchId.me")
	public String searchId(int memberNo) {
		String code = String.valueOf((int)(Math.random() * 90000 + 10000));
		String code1 = " ";
		System.out.println("첫번째 : " + code);
		Member m = mService.detailAllMember(memberNo);
		try {
			code1 = CrunchifyJavaMailExample.generateAndSendEmail(m, code);
			
			
		} catch (AddressException e) {
			
			e.printStackTrace();
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		return code1;
		
	}
	
	@RequestMapping("checkCode.me")
	public static void checkCode(String code) {
		System.out.println(code);
		
	}
	

}