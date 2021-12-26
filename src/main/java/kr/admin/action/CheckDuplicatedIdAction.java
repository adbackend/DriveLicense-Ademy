package kr.admin.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class CheckDuplicatedIdAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String admin_id = request.getParameter("admin_id");
		System.out.println("찍히냐~!"+admin_id);
		AdminDAO adminDAO = AdminDAO.getInstance();
		AdminVO adminVO = adminDAO.adminLogin(admin_id);
		
		Map<String, String> mapAjax = new HashMap<String, String>();
		
		
		System.out.println("어디서 오류...");
		
		if(adminVO==null) { //아이디 미중복
			mapAjax.put("result", "isNotFound");
		}else {
			mapAjax.put("result","idDuplicated");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String ajaxDate = mapper.writeValueAsString(mapAjax);
		request.setAttribute("ajaxData", ajaxDate);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
