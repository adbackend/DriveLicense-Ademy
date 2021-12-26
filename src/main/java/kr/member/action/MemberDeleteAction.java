package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class MemberDeleteAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Integer member_num = (Integer)session.getAttribute("member_num");
		String member_id = (String)session.getAttribute("member_id");
		
		if(member_num==null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd1");
		
		System.out.println("적은 비밀번호랑 일치하면됨 "+passwd);
		
		boolean check = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO memberVO = memberDAO.memberLogin(id);
		
		if(memberVO!=null && id.equals(member_id)) {
			
			System.out.println("모징.."+memberVO.getId());
			check = memberVO.isCheckPassword(passwd);
			
		}
		System.out.println("비밀번호체크 true넘어와야 성공..."+check);
		
		
		
		if(check) { //인증성공
			memberDAO.memberDelete(id,member_num);
			session.invalidate();
		}
		request.setAttribute("check",check);
		
		return "/WEB-INF/views/member/memberDelete.jsp";
	}
}
