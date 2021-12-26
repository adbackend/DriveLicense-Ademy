package kr.teacher.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.teacher.dao.TeacherDAO;
import kr.teacher.vo.TeacherVO;

public class TeacherInfoAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		TeacherDAO dao = TeacherDAO.getInstance();
		int count = dao.getTeacherCount();
		List<TeacherVO>list = null;
		list=dao.ListTeacher();
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		return "/WEB-INF/views/teacher/ListTeacherInfo.jsp";
	}

}
