package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class JoinFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("JoinFormAction  --->  ");
		
		
		return "/WEB-INF/views/member/memberJoinForm.jsp";
	}
	
}
