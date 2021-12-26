package kr.notice.action;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;
import kr.util.PaginationUtil;
import kr.util.PagingUtil;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null)pageNum = "1";
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int count = dao.getNoticeCount();
		
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum),count,10,10,"list.do");
		
		List<NoticeVO> list = null;
		if(count > 0) {
			list = dao.getListNotice(page.getStartCount(), page.getEndCount());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/notice/list.jsp";
	}
}
