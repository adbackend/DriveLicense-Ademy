package kr.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.admin.dao.AdminDAO;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.util.PaginationUtil;
import kr.util.PagingUtil;

public class MemberManageListFormAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		
		AdminDAO dao = AdminDAO.getInstance();
		int count = dao.getMemberCount();
		
		PaginationUtil page = new PaginationUtil(Integer.parseInt(pageNum),count,10,5,"memberManageListForm.do");
		
		List<MemberVO> list = null;
		if(count>0) {
			list = dao.memberManageList(page.getStartCount(), page.getEndCount());
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/admin/memberManagerListForm.jsp";
	}

}
