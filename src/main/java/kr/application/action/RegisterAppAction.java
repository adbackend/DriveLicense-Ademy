package kr.application.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.application.dao.ApplicationDAO;
import kr.application.vo.ApplicationVO;
import kr.controller.Action;

public class RegisterAppAction implements Action{

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
		
		int course_num = Integer.parseInt(request.getParameter("course_num"));
		
		ApplicationVO app = new ApplicationVO();
		app.setMember_num(member_num);
		app.setCourse_num(course_num);
		
		//수강신청 중복 체크
		ApplicationDAO dao = ApplicationDAO.getinstance();
		boolean check = dao.checkApp(app);
		if(check) {
			//수강신청 등록
			dao.insertApp(app);
		}
		
		request.setAttribute("check", check);
		
		return "/WEB-INF/views/application/registerApp.jsp";
	}
}