package kr.application.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.application.dao.ApplicationDAO;
import kr.application.vo.ApplicationVO;
import kr.controller.Action;
import kr.util.PaginationUtil;

public class ListAllAppAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		//세션에 저장된 관리자번호 읽어오기
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		//로그인되지 않은 경우, 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		//페이지번호 지정
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		String keyfield = request.getParameter("keyfield");
		if(keyfield == null) keyfield = "";
		
		String keyword = "";
		if(keyfield.equals("r")) {
			keyword = request.getParameter("re_keyword");
		}else {
			keyword = request.getParameter("keyword");
		}
		if(keyword == null) keyword = "";
		
		//총 레코드 수
		ApplicationDAO dao = ApplicationDAO.getinstance();
		int count = dao.getAppCountAll(keyfield, keyword);
		
		//페이지 처리
		PaginationUtil page = new PaginationUtil(keyfield, keyword, Integer.parseInt(pageNum), count, 5, 5, "listAllApp.do");
		
		//전체 수강신청 내역(관리자)
		List<ApplicationVO> list = null;
		if(count>0) {
			list = dao.getAppListAll(page.getStartCount(), page.getEndCount(), keyfield, keyword);
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/application/listAllApp.jsp";
	}
}