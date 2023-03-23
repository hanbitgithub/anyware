package com.aw.anyware.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.common.template.Pagination;
import com.aw.anyware.member.model.vo.Member;
import com.aw.anyware.project.model.service.ProjectService;
import com.aw.anyware.project.model.vo.Like;
import com.aw.anyware.project.model.vo.List;
import com.aw.anyware.project.model.vo.PjMem;
import com.aw.anyware.project.model.vo.Project;
import com.aw.anyware.project.model.vo.Todo;
import com.google.gson.Gson;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	// projectListView
	@RequestMapping("list.pj")
	public String selectProjectList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
									String category, String condition, String keyword, Model model, 
									HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = pService.selectListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		map.put("memberNo", memberNo);
		
		ArrayList<Project> list = pService.selectProjectList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "project/projectListView";
	}
	
	@RequestMapping("insert.pj")
	public String insertProject(Project pj, int memberNo, Model model) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pj", pj);
		map.put("memberNo", memberNo);
		
		int result = pService.insertProject(map);
		
		if(result == 0) {
			model.addAttribute("alertMsg", "프로젝트 생성에 실패했습니다.");
		}
		
		return "redirect:detail.pj?projectNo=" + result; // 상세페이지로 이동
	}
	
	@ResponseBody
	@RequestMapping(value="insertLike.ajax")
	public String insertLike(Like like, HttpSession session) {
		like.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = pService.insertLike(like);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteLike.ajax")
	public String deleteLike(Like like, HttpSession session) {
		like.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = pService.deleteLike(like);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="addrequest.ajax")
	public String addRequest(PjMem pm, HttpSession session) {
		
		pm.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		
		int status = pService.selectRequestStatus(pm);
		
		if(status == 0) { // 기존 요청 없음
			int result = pService.addRequest(pm);
			
			return result > 0 ? "success" : "fail";
			
		} else { // 기존 요청 있음
			return "already";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="addparticipant.ajax", produces="application/json; charset=UTF-8")
	public String addParticipant(PjMem pm) {
		
		int result = pService.addParticipant(pm);
		
		if(result > 0) {
			Member m = pService.selectParticipant(pm);
			return new Gson().toJson(m);
		} else {
			return "fail";
		}
		
	}
	
	// projectDetailView
	@RequestMapping("detail.pj")
	public String projectDetailView(PjMem pm, HttpSession session) {
		
		pm.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		
		Project pj = pService.selectProjectDetail(pm);
		
		session.setAttribute("pj", pj);
		
		return "project/projectDetailView";
	}
	
	@RequestMapping("insert.li")
	public String insertList(List list) {
		
		int result = pService.insertList(list);
		
		return "redirect:detail.pj?projectNo=" + list.getProjectNo();
	}
	
	@RequestMapping("participant.pj")
	public String manageParticipantView(int projectNo, Model model) {
		
		ArrayList<Member> dList = pService.selectDeptList();
		ArrayList<Member> mList = pService.selectMemberList();
		ArrayList<Member> pList = pService.selectParticipantList(projectNo);
		
		model.addAttribute("mList", mList);
		model.addAttribute("dList", dList);
		model.addAttribute("pList", pList);
		
		return "project/participantsManageView";
	}
	
	@ResponseBody
	@RequestMapping(value="deletepp.ajax")
	public String deleteParticipant(PjMem pm) {
		
		Member m = pService.selectParticipant(pm);
		
		if(m.getPosition().equals("Y")) {
			return "owner";
		} else {
			int result = pService.deleteParticipant(pm);
			return result > 0 ? "success" : "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="acceptpp.ajax", produces="application/json; charset=UTF-8")
	public String acceptParticipant(PjMem pm) {

		int result = pService.acceptParticipant(pm);
		
		if(result > 0) {
			Member m = pService.selectParticipant(pm);
			return new Gson().toJson(m);
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="rejectpp.ajax")
	public String rejectParticipant(PjMem pm) {
		
		int result = pService.rejectParticipant(pm);
		
		return result > 0 ? "success" : "fail";
	}
	
	// listDetailView
	@RequestMapping("detail.li")
	public String selectProjectDetail(int listNo, HttpSession session) {
		
		List l = pService.selectList(listNo);
		session.setAttribute("l", l);
		
		return "project/listDetailView";
	}
	
	@ResponseBody
	@RequestMapping(value="addtodo.ajax", produces="application/json; charset=UTF-8")
	public String addTodo(Todo td) {
		
		Todo todo = pService.addTodo(td);
		
		return new Gson().toJson(todo);
	}
	
	@ResponseBody
	@RequestMapping(value="updatetd.ajax")
	public String updateTodo(int todoNo, int length) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("todoNo", todoNo);
		map.put("length", length);
		
		int result = pService.updateTodo(map);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="deletetd.ajax")
	public String deleteTodo(int todoNo) {
		int result = pService.deleteTodo(todoNo);
		return result > 0 ? "success" : "fail";
	}

}
