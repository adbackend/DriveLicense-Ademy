package kr.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;

public class MainAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeDAO dao = NoticeDAO.getInstance();
		int count =dao.getNoticeCount();
		
		List<NoticeVO> list = null;
		if(count > 0) {
			list=dao.getListNotice(1, 5);
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		
		return "/WEB-INF/views/main/main.jsp";
	}

}
