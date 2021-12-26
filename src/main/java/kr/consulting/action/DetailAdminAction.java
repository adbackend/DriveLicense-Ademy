package kr.consulting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.consulting.dao.ConsultingDAO;
import kr.consulting.vo.ConsultingVO;
import kr.consultingDetail.vo.ConsultingDetailVO;
import kr.controller.Action;

public class DetailAdminAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		int consulting_num = Integer.parseInt(request.getParameter("consulting_num"));
		
		//세션에 저장된 값이 없으면 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		ConsultingDAO dao = ConsultingDAO.getIntance();
		ConsultingDetailVO consultingDetail  = dao.DetailConsultingAdmin(consulting_num);
		
		request.setAttribute("consulting", consultingDetail);
		
		return "/WEB-INF/views/consulting/admin/DetailConsultingAdmin.jsp";
	}

}
