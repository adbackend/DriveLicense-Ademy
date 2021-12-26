package kr.consulting.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.consulting.dao.ConsultingDAO;
import kr.consulting.vo.ConsultingVO;
import kr.controller.Action;
import kr.util.PaginationUtil;

public class ListAdminAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		//세션에 저장된 값이 없으면 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		//페이징처리
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		ConsultingDAO dao = ConsultingDAO.getIntance();
		int count = dao.getConsultingCount();	//총 레코드 수
		
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum), count, 5, 5, "adminList.do");
		
		List<ConsultingVO>list = null;
		if(count > 0) {
			list=dao.ListAdminConsulting(page.getStartCount(),page.getEndCount());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/consulting/admin/ListConsultingAdmin.jsp";
	}

}
