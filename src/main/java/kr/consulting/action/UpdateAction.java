package kr.consulting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.consulting.dao.ConsultingDAO;
import kr.consulting.vo.ConsultingVO;
import kr.controller.Action;

public class UpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");

		//세션에 저장된 값이 없으면 로그인 페이지 호출
		if(member_num == null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		int consulting_num = Integer.parseInt(request.getParameter("consulting_num"));
		
		ConsultingVO consulting = new ConsultingVO();
		consulting.setConsulting_num(consulting_num);
		
		java.sql.Date consulting_date = java.sql.Date.valueOf(request.getParameter("consulting_date"));
		consulting.setConsulting_date(consulting_date);
		
		consulting.setConsulting_time(request.getParameter("consulting_time_hour")+":"+request.getParameter("consulting_time_min"));
		
		ConsultingDAO dao = ConsultingDAO.getIntance();
		dao.UpdateConsulting(consulting);
		
		return "/WEB-INF/views/consulting/member/UpdateConsultingMember.jsp";
	}

}
