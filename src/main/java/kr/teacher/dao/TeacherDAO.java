package kr.teacher.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.teacher.vo.TeacherVO;
import kr.util.DBUtil;

public class TeacherDAO {
	//싱글톤 패턴
	private static TeacherDAO instance = new TeacherDAO();
	
	public static TeacherDAO getInstance() {
		return instance;
	}
	private TeacherDAO() {}
	
	//강사 추가
	public void InsertTeacher(TeacherVO teacher) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn =DBUtil.getConnection();
			sql = "INSERT INTO teacher(teacher_num, teacher_name, teacher_phone, teacher_email, teacher_profile) "
					+ "VALUES (teacher_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher.getTeacher_name());
			pstmt.setString(2, teacher.getTeacher_phone());
			pstmt.setString(3, teacher.getTeacher_email());
			pstmt.setString(4, teacher.getTeacher_profile());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//강사 목록
	public List<TeacherVO> ListTeacher() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TeacherVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM teacher";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			list = new ArrayList<TeacherVO>();
			while(rs.next()) {
				TeacherVO teacher = new TeacherVO();
				teacher.setTeacher_num(rs.getInt("teacher_num"));
				teacher.setTeacher_name(rs.getString("teacher_name"));
				teacher.setTeacher_phone(rs.getString("teacher_phone"));
				teacher.setTeacher_email(rs.getString("teacher_email"));
				teacher.setTeacher_profile(rs.getString("teacher_profile"));
				
				list.add(teacher);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//강사 정보 상세
	public TeacherVO getTeacher(int teacher_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TeacherVO teacher = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM teacher WHERE teacher_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teacher_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				teacher = new TeacherVO();
				teacher.setTeacher_num(rs.getInt("teacher_num"));
				teacher.setTeacher_name(rs.getString("teacher_name"));
				teacher.setTeacher_phone(rs.getString("teacher_phone"));
				teacher.setTeacher_email(rs.getString("teacher_email"));
				teacher.setTeacher_profile(rs.getString("teacher_profile"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return teacher;
	}
	//강사 수정(프로필 사진 포함)
	public void allUpdateTeacher(TeacherVO teacher) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE teacher SET teacher_name=?, teacher_email=?, teacher_phone=?,teacher_profile=? WHERE teacher_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher.getTeacher_name());
			pstmt.setString(2, teacher.getTeacher_email());
			pstmt.setString(3, teacher.getTeacher_phone());
			pstmt.setString(4, teacher.getTeacher_profile());
			pstmt.setInt(5, teacher.getTeacher_num());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//강사 수정(프로필 사진 미포함)
	public void updateTeacher(TeacherVO teacher) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE teacher SET teacher_name=?, teacher_email=?, teacher_phone=? WHERE teacher_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher.getTeacher_name());
			pstmt.setString(2, teacher.getTeacher_email());
			pstmt.setString(3, teacher.getTeacher_phone());
			pstmt.setInt(4, teacher.getTeacher_num());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
			
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//강사 삭제
	public void deleteTeacher(int teacher_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn= DBUtil.getConnection();
			sql = "DELETE FROM teacher WHERE teacher_num = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, teacher_num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//총 레코드수
	public int getTeacherCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT COUNT(*) FROM teacher";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
}
