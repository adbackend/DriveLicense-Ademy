package kr.consulting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.consulting.dao.ConsultingDAO;
import kr.consulting.vo.ConsultingVO;
import kr.controller.Action;

public class UpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");

		//세션에 저장된 값이 없으면 로그인 페이지 호출
		if(member_num == null) {
			return "redirect:/member/memberLoginForm.do";
		}
		int consulting_num = Integer.parseInt(request.getParameter("consulting_num"));
		ConsultingDAO dao = ConsultingDAO.getIntance();
		ConsultingVO consulting = dao.DetailConsulting(consulting_num);
		
		//로그인한 회원과 상담 신청한 회원이 일치하지 않으면
		if(member_num != consulting.getMember_num()) {
			return "redirect:/consulting/memberList.do";
		}
		
		request.setAttribute("consulting", consulting);
	
		return "/WEB-INF/views/consulting/member/UpdateConsultingMemberForm.jsp";
	}

}
