package kr.application.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.application.dao.ApplicationDAO;
import kr.application.vo.ApplicationVO;
import kr.controller.Action;

public class CancelAppAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		//세션에 저장된 회원번호 읽어오기
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");
		
		//로그인되지 않은 경우, 회원 로그인 페이지 호출
		if(member_num == null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		int app_num = Integer.parseInt(request.getParameter("app_num"));
		
		ApplicationDAO dao = ApplicationDAO.getinstance();
		ApplicationVO app = dao.getApp(app_num);
		
		//로그인한 회원과 수강신청 회원 일치 여부 확인
		if(member_num != app.getMember_num()) {
			return "redirect:/application/listApp.do";
		}
		
		//수강신청 삭제
		dao.deleteApp(app_num);
		
		return "/WEB-INF/views/application/cancelApp.jsp";
	}
}