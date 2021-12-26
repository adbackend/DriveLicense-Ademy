package kr.course.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;
import kr.util.FileUtil;

public class UpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int course_num = Integer.parseInt(request.getParameter("course_num"));
		
		CourseVO course = new CourseVO();
		course.setCourse_num(course_num);
		course.setCourse_name(request.getParameter("course_name"));
		course.setTeacher_num(Integer.parseInt(request.getParameter("teacher_num")));
		course.setTuition(Integer.parseInt(request.getParameter("tuition")));
		
		CourseDAO dao = CourseDAO.getInstance();
		dao.updateCourse(course);
		
		return "/WEB-INF/views/course/update.jsp";
	}

}



