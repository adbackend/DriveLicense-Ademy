package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

/**
 * FileName : LoginAction.java
 * @date :2021. 9. 9.
 * @author: 최유정
 * @description : 관리자 로그인
 */
public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		String admin_id = request.getParameter("admin_id");
		String admin_passwd = request.getParameter("admin_passwd");
		
		System.out.println(admin_id);
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		AdminVO adminVO = adminDAO.adminLogin(admin_id);
		
		if (adminVO == null)
			return "/WEB-INF/views/admin/adminLogin.jsp";
		
		boolean check = false;
		
		if(admin_passwd != null)
			check = adminVO.isCheckPassword(admin_passwd);
		

		if(check) { //비밀번호 일치시
			HttpSession session = request.getSession();
			
			session.setAttribute("admin_num", adminVO.getAdmin_num());
			session.setAttribute("admin_id", adminVO.getAdmin_id());
			session.setAttribute("admin_auth", adminVO.getAdmin_auth());			
			
			return "redirect:/main/main.do"; //로그인 성공시 
		}
		
		return "/WEB-INF/views/admin/adminLogin.jsp"; //로그인 실패시, 로그인페이지로 이동
	}
}
