package kr.course.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;
import kr.util.PaginationUtil;
import kr.util.PagingUtil;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null)pageNum = "1";
		
		CourseDAO dao = CourseDAO.getInstance();
		int count = dao.getCourseCount();
		
		//페이지 처리
		//currentPage, count, rowCount, pageCount, url
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum),count,5,5,"list.do");
		
		List<CourseVO> list = null;
		if(count > 0) {
			list = dao.getListCourse(page.getStartCount(), page.getEndCount());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/course/list.jsp";
	}

}
