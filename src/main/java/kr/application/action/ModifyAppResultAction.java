package kr.application.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.application.dao.ApplicationDAO;
import kr.controller.Action;

public class ModifyAppResultAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		//세션에 저장된 관리자번호 읽어오기
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		//로그인되지 않은 경우, 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		int app_num = Integer.parseInt(request.getParameter("app_num"));
		int app_result = Integer.parseInt(request.getParameter("app_result"));
		
		//수강신청 결과 변경
		ApplicationDAO dao = ApplicationDAO.getinstance();
		dao.setAppResult(app_num, app_result);
		
		request.setAttribute("app_num", app_num);
		
		return "/WEB-INF/views/application/modifyAppResult.jsp";
	}
}