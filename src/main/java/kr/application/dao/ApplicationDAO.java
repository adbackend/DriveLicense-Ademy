package kr.application.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.application.vo.ApplicationVO;
import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class ApplicationDAO {
	//싱글턴 패턴
	private static ApplicationDAO instance = new ApplicationDAO();
	public static ApplicationDAO getinstance() {
		return instance;
	}
	private ApplicationDAO() {}
	
	//수강신청 등록
	public void insertApp(ApplicationVO app) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO application(app_num,member_num,course_num,app_result,app_date) VALUES(Application_seq.nextval,?,?,0,SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, app.getMember_num());
			pstmt.setInt(2, app.getCourse_num());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//수강신청 중복 체크 - true: 미중복, false:중복
	public boolean checkApp(ApplicationVO app) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean check = false;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT COUNT(*) FROM application WHERE member_num=? AND course_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, app.getMember_num());
			pstmt.setInt(2, app.getCourse_num());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == 0) {
					check = true;
				}
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return check;
	}
	
	//수강신청 정보
		public ApplicationVO getApp(int app_num) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			ApplicationVO app = null;
			
			try {
				conn = DBUtil.getConnection();
				
				sql = "SELECT * FROM application WHERE app_num=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, app_num);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					//수강신청 정보
					app = new ApplicationVO();
					app.setApp_num(rs.getInt("app_num"));
					app.setApp_date(rs.getDate("app_date"));
					app.setApp_result(rs.getInt("app_result"));
					app.setCourse_num(rs.getInt("course_num"));
					app.setMember_num(rs.getInt("member_num"));
				}
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(rs, pstmt, conn);
			}
			return app;
		}
	
	//총 레코드 수 - 일반회원
	public int getAppCount(int member_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT count(*) FROM application WHERE member_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	//수강신청 목록 - 일반회원
	public List<ApplicationVO> getAppList(int member_num, int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ApplicationVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM (SELECT X.*, ROWNUM rnum FROM (SELECT * FROM application A "
					+ "JOIN course C ON A.course_num=C.course_num "
					+ "JOIN teacher T ON C.teacher_num=T.teacher_num "
					+ "WHERE member_num=? ORDER BY app_num DESC) X) WHERE rnum>=? AND rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ApplicationVO>();
			while(rs.next()) {
				ApplicationVO app = new ApplicationVO();
				app.setApp_num(rs.getInt("app_num"));
				app.setApp_date(rs.getDate("app_date"));
				app.setApp_result(rs.getInt("app_result"));
				app.setCourse_num(rs.getInt("course_num"));
				app.setMember_num(rs.getInt("member_num"));
				app.setCourse_name(rs.getString("course_name"));
				app.setTeacher_name(rs.getString("teacher_name"));
				
				list.add(app);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}

	//수강신청 삭제
	public void deleteApp(int app_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "DELETE FROM application WHERE app_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, app_num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//총 레코드 수 - 관리자
	public int getAppCountAll(String keyfield, String keyword) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = null;
		int count = 0;
		
		try {
			conn = DBUtil.getConnection();
			
			//검색값 없을 때
			if(keyfield==null || keyword.equals("")) {
				sql = "SELECT COUNT(*) FROM application A JOIN course C ON A.course_num=C.course_num "
						+ "JOIN teacher T ON C.teacher_num=T.teacher_num JOIN member_detail D ON A.member_num=D.member_num ORDER BY app_num DESC";
				pstmt = conn.prepareStatement(sql);
			}else {
				if(keyfield.equals("c")) sub_sql="course_name LIKE ?";
				else if(keyfield.equals("t")) sub_sql="teacher_name LIKE ?";
				else if(keyfield.equals("m")) sub_sql="name LIKE ?";
				else if(keyfield.equals("r")) sub_sql="app_result=?";
				
				sql = "SELECT COUNT(*) FROM application A JOIN course C ON A.course_num=C.course_num "
						+ "JOIN teacher T ON C.teacher_num=T.teacher_num JOIN member_detail D ON A.member_num=D.member_num WHERE "
						+ sub_sql + " ORDER BY app_num DESC";
				
				pstmt = conn.prepareStatement(sql);
				
				if(keyfield.equals("r")) {
					pstmt.setInt(1, Integer.parseInt(keyword));
				}else {
					pstmt.setString(1, "%" + keyword + "%");
				}
			}
			
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	//전체 수강신청 목록 - 관리자
	public List<ApplicationVO> getAppListAll(int start, int end, String keyfield, String keyword) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = null;
		List<ApplicationVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			
			//검색값 없을 때
			if(keyfield==null || keyword.equals("")) {
				sql = "SELECT * FROM (SELECT X.*, ROWNUM rnum FROM (SELECT * FROM application A "
						+ "JOIN course C ON A.course_num=C.course_num "
						+ "JOIN teacher T ON C.teacher_num=T.teacher_num "
						+ "JOIN member_detail D ON A.member_num=D.member_num "
						+ "ORDER BY app_num DESC) X) WHERE rnum>=? AND rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				if(keyfield.equals("c")) sub_sql="course_name LIKE ?";
				else if(keyfield.equals("t")) sub_sql="teacher_name LIKE ?";
				else if(keyfield.equals("m")) sub_sql="name LIKE ?";
				else if(keyfield.equals("r")) sub_sql="app_result=?";
				
				sql = "SELECT * FROM (SELECT X.*, ROWNUM rnum FROM (SELECT * FROM application A "
						+ "JOIN course C ON A.course_num=C.course_num "
						+ "JOIN teacher T ON C.teacher_num=T.teacher_num "
						+ "JOIN member_detail D ON A.member_num=D.member_num "
						+ "WHERE " + sub_sql + " ORDER BY app_num DESC) X) WHERE rnum>=? AND rnum<=?";
				
				pstmt = conn.prepareStatement(sql);
				
				if(keyfield.equals("r")) {
					pstmt.setInt(1, Integer.parseInt(keyword));
				}else {
					pstmt.setString(1, "%" + keyword + "%");
				}
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			
			//SQL문 실행
			rs = pstmt.executeQuery();
			list = new ArrayList<ApplicationVO>();
			while(rs.next()) {
				ApplicationVO app = new ApplicationVO();
				app.setApp_num(rs.getInt("app_num"));
				app.setApp_date(rs.getDate("app_date"));
				app.setApp_result(rs.getInt("app_result"));
				app.setCourse_num(rs.getInt("course_num"));
				app.setMember_num(rs.getInt("member_num"));
				app.setName(rs.getString("name"));
				app.setCourse_name(rs.getString("course_name"));
				app.setTeacher_name(rs.getString("teacher_name"));
				list.add(app);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//수강신청 상세(과정명, 강사명, 회원명 JOIN) - 관리자
	public HashMap<String,Object> getAppDetail(int app_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		HashMap<String,Object> hmap = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM application A "
					+ "JOIN course C ON A.course_num=C.course_num "
					+ "JOIN teacher T ON C.teacher_num=T.teacher_num "
					+ "JOIN member M ON A.member_num = M.member_num "
					+ "JOIN member_detail D ON A.member_num=D.member_num WHERE app_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, app_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//수강신청 정보
				ApplicationVO app = new ApplicationVO();
				app.setApp_num(rs.getInt("app_num"));
				app.setApp_date(rs.getDate("app_date"));
				app.setApp_result(rs.getInt("app_result"));
				app.setCourse_num(rs.getInt("course_num"));
				app.setMember_num(rs.getInt("member_num"));
				app.setName(rs.getString("name"));
				app.setCourse_name(rs.getString("course_name"));
				app.setTeacher_name(rs.getString("teacher_name"));
				
				//회원 정보
				MemberVO member = new MemberVO();
				member.setMember_num(rs.getInt("member_num"));
				member.setAuth(rs.getInt("auth"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setZipcode(rs.getString("zipcode"));
				
				hmap = new HashMap<String,Object>();
				hmap.put("app", app);
				hmap.put("member", member);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return hmap;
	}
	
	//수강신청 결과 변경 - 관리자
	public void setAppResult(int app_num, int app_result) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "UPDATE application SET app_result=? WHERE app_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, app_result);
			pstmt.setInt(2, app_num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//강사 맵 : 강사번호로 강사이름 찾을 용도
	public HashMap<Integer,String> getTeacherMap() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		HashMap<Integer,String> map = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM teacher ORDER BY teacher_num";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			map = new HashMap<Integer,String>();
			while(rs.next()) {
				map.put(rs.getInt("teacher_num"), rs.getString("teacher_name"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return map;
	}
}