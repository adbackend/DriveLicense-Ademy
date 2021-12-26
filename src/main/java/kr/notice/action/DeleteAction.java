package kr.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;
import kr.util.FileUtil;

public class DeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		if(admin_num==null) {//로그인이 되지 않은 경우
			return "redirect:/admin/adminLoginForm.do";
		}
		
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO notice = dao.getNotice(notice_num);
		if(admin_num != notice.getAdmin_num()) {
			//로그인한 관리자번호와 작성자 관리자번호가 불일치
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인한 관리자번호와 작성자 관리자번호가 일치
		dao.deleteNotice(notice_num);
		//파일 삭제
		FileUtil.removeFile(request, notice.getFilename());
		
		return "redirect:/notice/list.do";
	}

}
