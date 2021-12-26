package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class AdminAddAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		if(admin_num==null) { //로그인 안되있으면
			return "redirect:/main/main.do";
		}else {
			
			AdminVO adminVO = new AdminVO();
			adminVO.setAdmin_num(admin_num);
			adminVO.setAdmin_id(request.getParameter("admin_id"));
			adminVO.setAdmin_name(request.getParameter("admin_name"));
			adminVO.setAdmin_passwd(request.getParameter("admin_passwd"));
			adminVO.setAdmin_auth(Integer.parseInt(request.getParameter("admin_auth")));

			
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.adminAdd(adminVO);
			
			return "/WEB-INF/views/admin/adminRegisterResult.jsp";
			
		}
		
		
	}
}
