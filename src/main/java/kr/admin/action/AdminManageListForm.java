package kr.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;
import kr.util.PaginationUtil;

public class AdminManageListForm implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 체크
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		if(admin_num==null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		//페이징 처리
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		int count = adminDAO.getAdminCount();
		
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum),count,5,5,"adminManageListForm.do");
		
		List<AdminVO> list = null;
		if(count > 0) {
			list = adminDAO.adminList(page.getStartCount(), page.getEndCount());
		}
		request.setAttribute("count", count);
		request.setAttribute("adminList", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		return "/WEB-INF/views/admin/adminManageListForm.jsp";
	}

}
