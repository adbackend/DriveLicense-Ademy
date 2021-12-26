package kr.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;
import kr.util.FileUtil;

public class UpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		if(admin_num==null) {//로그인이 되지 않은 경우
			return "redirect:/admin/adminLoginForm.do";
		}
		
		MultipartRequest multi = FileUtil.createFile(request);
		int notice_num = Integer.parseInt(multi.getParameter("notice_num"));
		String filename = multi.getFilesystemName("filename");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		//수정전 데이터
		NoticeVO dbNotice = dao.getNotice(notice_num);
		if(admin_num != dbNotice.getAdmin_num()) {//로그인한 관리자와 작성자 관리자번호가 불일치
			FileUtil.removeFile(request, filename);//업로드된 파일이 있으면 파일 삭제
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인한 관리자와 작성자 관리자번호가 일치
		NoticeVO notice = new NoticeVO();
		notice.setNotice_num(notice_num);
		notice.setTitle(multi.getParameter("title"));
		notice.setContent(multi.getParameter("content"));
		notice.setFilename(filename);
		
		dao.updateNotice(notice);
		
		if(filename!=null) {//새 파일로 교체할 때 원래 파일 제거
			FileUtil.removeFile(request, dbNotice.getFilename());			
		}
		
		return "redirect:/notice/list.do";
	}

}
