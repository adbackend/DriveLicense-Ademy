package kr.teacher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.teacher.dao.TeacherDAO;
import kr.teacher.vo.TeacherVO;
import kr.util.FileUtil;

public class RegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		//세션에 저장된 값이 없으면 관리자 로그인 페이지 호출
		if(admin_num == null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = FileUtil.createFile(request);
		TeacherVO teacher = new TeacherVO();
		teacher.setTeacher_name(multi.getParameter("name"));
		teacher.setTeacher_profile(multi.getFilesystemName("photo"));
		teacher.setTeacher_phone(multi.getParameter("phone"));
		teacher.setTeacher_email(multi.getParameter("email"));
		
		TeacherDAO dao = TeacherDAO.getInstance();
		dao.InsertTeacher(teacher);
		
		return "/WEB-INF/views/teacher/RegisterTeacher.jsp";
	}

}
