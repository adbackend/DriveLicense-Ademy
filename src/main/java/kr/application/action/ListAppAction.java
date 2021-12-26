package kr.application.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.application.dao.ApplicationDAO;
import kr.application.vo.ApplicationVO;
import kr.controller.Action;
import kr.util.PaginationUtil;

public class ListAppAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		//세션에 저장된 회원번호 읽어오기
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");
		
		//로그인되지 않은 경우, 회원 로그인 페이지 호출
		if(member_num==null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		//페이지번호 지정
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		//총 레코드 수
		ApplicationDAO dao = ApplicationDAO.getinstance();
		int count = dao.getAppCount(member_num);
		
		//페이지 처리
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum), count, 5, 5, "listApp.do");
		
		//수강신청 내역(회원)
		List<ApplicationVO> list = null;
		if(count>0) {
			list = dao.getAppList(member_num, page.getStartCount(), page.getEndCount());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/application/listApp.jsp";
	}
}