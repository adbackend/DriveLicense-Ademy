package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class MyPageModifyAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		String admin_id = (String)session.getAttribute("admin_id");
		
		System.out.println(admin_num+"앙");
		if(admin_id==null) {
			return "redirect:/main/main.do";
		}else {
			
			AdminVO adminVO = new AdminVO();
			
			System.out.println("수정수정수정수정");
			adminVO.setAdmin_id(admin_id);
			adminVO.setAdmin_name(request.getParameter("admin_name"));
			adminVO.setAdmin_passwd(request.getParameter("admin_passwd"));
			adminVO.setAdmin_num(admin_num);
			
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.myPageModify(adminVO);
			
			return "/WEB-INF/views/admin/myPageModify.jsp";
		}
	}
}
