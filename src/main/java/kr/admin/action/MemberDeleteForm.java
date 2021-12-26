package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class MemberDeleteForm implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int member_num2 = Integer.parseInt(request.getParameter("member_num2"));
		String id2 = request.getParameter("id2");
		String name2 = request.getParameter("name2");
		
		request.setAttribute("member_num2", member_num2);
		request.setAttribute("id2", id2);
		request.setAttribute("name2", name2);
		
		return "/WEB-INF/views/admin/memberDeleteForm.jsp";
	}

}
