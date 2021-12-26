package kr.course.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.course.vo.CourseVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

public class CourseDAO {
	//싱글턴 패턴
	private static CourseDAO instance = new CourseDAO();
	
	public static CourseDAO getInstance() {
		return instance;
	}
	private CourseDAO() {}
	
	//context.xml에서 설정 정보를 읽어들여 커넥션풀로부터 커넥션을 할당
	private Connection getConnection()throws Exception{
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/xe");
		return ds.getConnection();
	}
	
	//자원정리
	private void executeClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs!=null)try {rs.close();} catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();} catch(SQLException e) {}
		if(conn!=null)try {conn.close();} catch(SQLException e) {}
	}
	
	//과정 등록
	public void insertCourse(CourseVO course)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "INSERT INTO course (course_num,course_name,teacher_num,tuition) VALUES (course_seq.nextval,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			//데이터 바인딩
			pstmt.setString(1, course.getCourse_name());
			pstmt.setInt(2, course.getTeacher_num());
			pstmt.setInt(3, course.getTuition());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//과정 삭제
	public void deleteCourse(int course_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "DELETE FROM course WHERE course_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, course_num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//과정 수정
	public void updateCourse(CourseVO courseVO)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = getConnection();
			
			//SQL문 작성
			//수정가능 course_name,teacher_num,tuition
			sql = "UPDATE course SET course_name=?,teacher_num=?,tuition=? WHERE course_num=?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, courseVO.getCourse_name());
			pstmt.setInt(2, courseVO.getTeacher_num());
			pstmt.setInt(3, courseVO.getTuition());
			pstmt.setInt(4, courseVO.getCourse_num());
			
			//SQL문 실행
			pstmt.executeUpdate();

		}catch(Exception e) {
			throw new Exception();
		}finally {
			//자원정리
			executeClose(null, pstmt, conn);
		}
	}
	
	//과정 상세 정보
	public CourseVO getCourse(int num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CourseVO course = null;
		String sql = null;
		
		try {
			conn = getConnection();
			
			sql = "SELECT * FROM course WHERE course_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			//SQL문을 실행하고 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();

			if(rs.next()) {
				course = new CourseVO();
				course.setCourse_num(rs.getInt("course_num"));
				course.setCourse_name(rs.getString("course_name"));
				course.setTeacher_num(rs.getInt("teacher_num"));
				course.setTuition(rs.getInt("tuition"));
			}
		}catch(Exception e) {
			throw new Exception();
		}finally {
			//자원정리
			executeClose(rs, pstmt, conn);
		}
		return course;
	}
	
	//총 과정 수
	public int getCourseCount()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT COUNT(*) FROM course";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//SQL문 실행하고 결과행을 ResultSet에 담음
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
	
	//과정목록
	public List<CourseVO> getListCourse(int start, int end)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CourseVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM(SELECT a.*, "
					+ "ROWNUM rnum FROM (SELECT * FROM teacher T "
					+ "INNER JOIN Course C "
					+ "ON t.teacher_num = c.teacher_num "
					+ "ORDER BY c.course_num desc)a) "
					+ "WHERE rnum>=? AND rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<CourseVO>();
			while(rs.next()) {
				CourseVO course = new CourseVO();
				course.setCourse_num(rs.getInt("course_num"));
				course.setCourse_name(rs.getString("course_name"));
				course.setTeacher_num(rs.getInt("teacher_num"));
				course.setTuition(rs.getInt("tuition"));
				course.setTeacher_name(rs.getString("teacher_name"));
				
				list.add(course);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
}
