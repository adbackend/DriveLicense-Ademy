package kr.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

/**
 * FileName : LoginAction.java
 * @date :2021. 9. 9.
 * @author: 최유정
 * @description :
 */
public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO memberVO = memberDAO.memberLogin(id);
				
		boolean check = false;
		
			
		if(memberVO!=null) {//비밀번호 일치 여부 체크
			check = memberVO.isCheckPassword(passwd);
		}
		
		if(check) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member_num", memberVO.getMember_num());
			session.setAttribute("member_id", memberVO.getId());
			session.setAttribute("member_passwd", memberVO.getPasswd());
			session.setAttribute("member_auth", memberVO.getAuth());
			
			//인증 성공시 호출
			return "redirect:/main/main.do";
		}
		
		
		//인증 실패시 호출
		return "/WEB-INF/views/member/memberLogin.jsp";
	}
}
