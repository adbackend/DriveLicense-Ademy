package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

/**
 * FileName : MyPageModifyAction.java
 * @date :2021. 9. 8.
 * @author: 최유정
 * @description : 회원 마이페이지 수정 데이터 받음
 */
public class MyPageModifyAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String member_id = session.getId();
		
		
		if(member_id==null) { //로그인이 안되있으면
			
			return "redirect:/main/main.do";
		}else {//수정할 데이터 받기
			MemberVO memberVO = new MemberVO();
			
			memberVO.setPasswd(request.getParameter("passwd1"));
			memberVO.setName(request.getParameter("name"));
			memberVO.setZipcode(request.getParameter("zipcode"));
			memberVO.setAddress1(request.getParameter("address1"));
			memberVO.setAddress2(request.getParameter("address2"));
			memberVO.setEmail(request.getParameter("email"));
			memberVO.setBirth(request.getParameter("birth"));
			memberVO.setPhone(request.getParameter("phone"));
			memberVO.setMember_num(Integer.parseInt(request.getParameter("member_num")));
			
			
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			memberDAO.myPageModify(memberVO);
			
			return "/WEB-INF/views/member/myPageModify.jsp";
		}
		
	}
}
