package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class MemberDeleteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("member_id");
		Integer member_num = (Integer)session.getAttribute("member_num");

		if(member_id==null) {
			return "redirect:/member/memberLoginForm.do";
		}
			
			MemberDAO memberDAO = MemberDAO.getInstance();
		
			MemberVO memberVO = memberDAO.memberDetail(member_num);
		
			request.setAttribute("member", memberVO);	
			return "/WEB-INF/views/member/memberDeleteForm.jsp";
		
		
	}
}
