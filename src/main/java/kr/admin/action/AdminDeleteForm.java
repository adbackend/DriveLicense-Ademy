package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class AdminDeleteForm implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("으악");
		String admin_name2 = request.getParameter("admin_name2");
		String admin_id2 = request.getParameter("admin_id2");
		System.out.println("네임은....?"+admin_name2);
		int admin_num2 = Integer.parseInt(request.getParameter("admin_num2"));
		
		
		System.out.println("아무것도."+admin_num2);
		request.setAttribute("admin_num2", admin_num2);
		request.setAttribute("admin_name2", admin_name2);
		request.setAttribute("admin_id2", admin_id2);
		
		
		return "/WEB-INF/views/admin/adminDeleteForm.jsp";
	}
}
