package kr.application.action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.application.dao.ApplicationDAO;
import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;
import kr.util.PaginationUtil;

public class RegisterAppFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		//페이지번호 지정
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		
		//총 레코드 수
		CourseDAO dao = CourseDAO.getInstance();
		int count = dao.getCourseCount();
		
		//페이지 처리
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum), count, 5, 5, "registerAppForm.do");
		
		//과정 목록
		List<CourseVO> list = null;
		HashMap<Integer,String> map = null;
		if(count>0) {
			list = dao.getListCourse(page.getStartCount(),page.getEndCount());
			map = ApplicationDAO.getinstance().getTeacherMap();
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		request.setAttribute("map", map);
		
		return "/WEB-INF/views/application/registerAppForm.jsp";
	}
}