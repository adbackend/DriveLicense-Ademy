package kr.teacher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.teacher.dao.TeacherDAO;
import kr.teacher.vo.TeacherVO;

public class UpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		//세션에 저장된 값이 없으면 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		int teacher_num = Integer.parseInt(request.getParameter("teacher_num"));
		TeacherDAO dao = TeacherDAO.getInstance();
		TeacherVO teacher = dao.getTeacher(teacher_num);
		
		request.setAttribute("teacher", teacher);
		
		return "/WEB-INF/views/teacher/UpdateTeacherForm.jsp";
	}

}
