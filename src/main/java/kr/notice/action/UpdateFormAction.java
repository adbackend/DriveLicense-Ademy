package kr.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;

public class UpdateFormAction implements Action{

	@Override
public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		if(admin_num == null) {//로그인 되지 않은 경우
			return "redirect:/admin/adminLoginForm.do";
		}
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO notice = dao.getNotice(notice_num);
		if(admin_num != notice.getAdmin_num()) {//로그인한 관리자와 작성자 관리자번호 불일치
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인이 되어있고 로그인한 관리자와 작성자 관리자번호 일치
		request.setAttribute("notice", notice);
		
		return "/WEB-INF/views/notice/updateForm.jsp";
	}
	
}
