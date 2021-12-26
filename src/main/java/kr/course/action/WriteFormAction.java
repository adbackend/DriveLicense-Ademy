package kr.course.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.teacher.dao.TeacherDAO;
import kr.teacher.vo.TeacherVO;

public class WriteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		//강사 목록 불러오기
		TeacherDAO Tdao = TeacherDAO.getInstance();
		List<TeacherVO> list = Tdao.ListTeacher();
				
		request.setAttribute("list", list);		
				
		return "/WEB-INF/views/course/writeForm.jsp";
	}

}
