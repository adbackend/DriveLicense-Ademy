package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class MainAdminPageForm implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		String admin_id = (String)session.getAttribute("admin_id");
		
		if(admin_id==null) {
			
			return "redirect:/admin/adminLoingForm.jsp";
		}
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		AdminVO adminVO = adminDAO.adminLogin(admin_id);
		
		request.setAttribute("adminVO", adminVO);
		
		
		return "/WEB-INF/views/admin/mainAdminPageForm.jsp";
	}

}
