package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class JoinAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(request.getParameter("id"));  //1
		memberVO.setPasswd(request.getParameter("passwd1")); //2
		memberVO.setName(request.getParameter("name")); //3
		memberVO.setZipcode(request.getParameter("zipcode")); //4
		memberVO.setAddress1(request.getParameter("address1")); //5
		memberVO.setAddress2(request.getParameter("address2")); //6
		memberVO.setEmail(request.getParameter("email")); //7
		
		
		
//		String->Date로 변환
		
		
//		String Rbirth = request.getParameter("birth");
//		
//		Date birth = Date.valueOf(Rbirth);
//		System.out.println("뭐가 찍힐까"+birth);
//		memberVO.setBirth(birth);

		// --------------------------------
		
//	    java.util.Date utilDate = new java.util.Date();
//	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		
//	    
//		
//		String Rbirth = request.getParameter("birth");
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = (Date) sdf.parse(Rbirth);
//		memberVO.setBirth(date);
//		System.out.println("~~~~~~~~"+memberVO.getBirth());

	    
		memberVO.setBirth(request.getParameter("birth")); //8
		
		memberVO.setPhone(request.getParameter("phone")); //9
		
		MemberDAO memberLoginDAO = MemberDAO.getInstance();
		memberLoginDAO.memberJoin(memberVO);
		
		return "/WEB-INF/views/member/memberJoin.jsp";
	}

}
