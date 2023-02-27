package com.aw.anyware.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

/*
 * 
			Interceptor ( 정확히는 HandlerInterceptor)
	   - 해당 컨트롤러가 실행되기 전, 실행된 후에 낚아채서 실행할 내용 작성 가능 (양방향 가능)
	  ex) 해당 요청을 할 수 있는 회원이 맞는지 "로그인 여부 판단"
          해당 요청을 할 수 있는 권한의 회원이 맞는지 "권한 체크할때"
          
          preHandle(전 처리)
          postHandle(후 처리)
 * 
 */

public class LoginInterceptor implements HandlerInterceptor{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//true 리턴 = > 기존 요청 흐름대로
		//false 리턴 = > Controller 실행되지 않음
		
		HttpSession session = request.getSession();
		
		// 로그인 됐을 경우 
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {// 로그인 안 됐을 경우
			session.setAttribute("alertMsg", "로그인 후 이용가능한 페이지입니다");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	

} 
