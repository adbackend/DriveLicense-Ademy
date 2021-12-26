package kr.member.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class CheckDuplicatedIdAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		System.out.println("아이디 중복 안된게 찍혀야 정상--> "+id);
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO memberVO = memberDAO.checkId(id);
		
		
		Map<String,String> mapAjax = new HashMap<String, String>();
		
		if(memberVO == null) {  //아이디 미중복
			mapAjax.put("result", "idNotFound");
		}else {
			mapAjax.put("result", "idDuplicated");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String ajaxDate = mapper.writeValueAsString(mapAjax);
		request.setAttribute("ajaxData", ajaxDate);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
}




