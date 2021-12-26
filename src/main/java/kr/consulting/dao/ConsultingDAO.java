package kr.consulting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.consulting.vo.ConsultingVO;
import kr.consultingDetail.vo.ConsultingDetailVO;
import kr.util.DBUtil;

public class ConsultingDAO {
	//싱글톤 패턴
	private static ConsultingDAO instance = new ConsultingDAO();
	
	public static ConsultingDAO getIntance() {
		return instance;
	}
	private ConsultingDAO() {}
	
	//상담 예약(일반회원)
	public void InsertConsulting(ConsultingVO consulting) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO consulting(consulting_num,member_num,consulting_date,consulting_time) "
					+ "VALUES (consulting_seq.NEXTVAL,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, consulting.getMember_num());
			pstmt.setDate(2, consulting.getConsulting_date());
			pstmt.setString(3, consulting.getConsulting_time());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//상담 예약 목록(일반 회원)
	public List<ConsultingVO> ListConsulting(int member_num, int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ConsultingVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM(SELECT a.*, ROWNUM rnum FROM "
					+ "(SELECT * FROM member M "
					+ "INNER JOIN member_detail D "
					+ "ON m.member_num = d.member_num "
					+ "INNER JOIN Consulting C "
					+ "ON c.member_num = d.member_num "
					+ "where m.member_num = ? "
					+ "ORDER BY c.consulting_num desc)a)"
					+ "WHERE rnum>=? AND rnum<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs=pstmt.executeQuery();
			list = new ArrayList<ConsultingVO>();
			
			while(rs.next()) {
				ConsultingVO consulting = new ConsultingVO();
				consulting.setConsulting_num(rs.getInt("consulting_num"));
				consulting.setConsulting_date(rs.getDate("consulting_date"));
				consulting.setConsulting_time(rs.getString("consulting_time"));
				consulting.setCon_date(rs.getDate("con_date"));
				consulting.setCon_state(rs.getInt("con_state"));
				
				list.add(consulting);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//해당 회원의 상담 신청 갯수
	public int getMemberConsulting(int member_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT COUNT(*) FROM consulting WHERE member_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_num);
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

	//상담 취소(일반회원)
	public void DeleteConsulting(int consulting_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM consulting WHERE consulting_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consulting_num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//상담 상세 내역
	public ConsultingVO DetailConsulting(int consulting_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ConsultingVO consulting = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM consulting WHERE consulting_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consulting_num);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				consulting = new ConsultingVO();
				consulting.setMember_num(rs.getInt("member_num"));
				consulting.setConsulting_num(rs.getInt("consulting_num"));
				consulting.setConsulting_date(rs.getDate("consulting_date"));
				consulting.setConsulting_time(rs.getString("consulting_time"));
				consulting.setCon_date(rs.getDate("con_date"));
				consulting.setCon_state(rs.getInt("con_state"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return consulting;
	}
	
	//상담 수정(일반회원)
	public void UpdateConsulting(ConsultingVO consulting)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE consulting SET consulting_date=?, consulting_time=? WHERE consulting_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, consulting.getConsulting_date());
			pstmt.setString(2, consulting.getConsulting_time());
			pstmt.setInt(3, consulting.getConsulting_num());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//상담 목록(관리자)
	public List<ConsultingVO> ListAdminConsulting(int start, int end) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ConsultingVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM(SELECT a.*, ROWNUM rnum FROM "
					+ "(SELECT * FROM member M "
					+ "INNER JOIN member_detail D "
					+ "ON m.member_num = d.member_num "
					+ "INNER JOIN Consulting C "
					+ "ON c.member_num = d.member_num "
					+ "ORDER BY c.consulting_num desc)a)"
					+ "WHERE rnum>=? AND rnum<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<ConsultingVO>();
			
			while(rs.next()) {
				ConsultingVO consulting = new ConsultingVO();
				consulting.setConsulting_num(rs.getInt("consulting_num"));
				consulting.setConsulting_date(rs.getDate("consulting_date"));
				consulting.setConsulting_time(rs.getString("consulting_time"));
				consulting.setCon_state(rs.getInt("con_state"));
				consulting.setCon_date(rs.getDate("con_date"));
				consulting.setId(rs.getString("id"));
				consulting.setMember_num(rs.getInt("member_num"));
				
				list.add(consulting);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//총 레코드 수 (관리자)
	public int getConsultingCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT COUNT(*) FROM consulting";
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
	
	//상담 상태변경(관리자)
	public void UpdateConsultingAdmin(int consulting_num, int con_state) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE consulting SET con_state=? WHERE consulting_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, con_state);
			pstmt.setInt(2, consulting_num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//상담 상세 정보(관리자)
	public ConsultingDetailVO DetailConsultingAdmin(int consulting_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ConsultingDetailVO consultingDetail = null;
		
		try {
			conn = DBUtil.getConnection();
			sql ="SELECT * FROM member M "
					+ "INNER JOIN member_detail D "
					+ "ON m.member_num = d.member_num "
					+ "INNER JOIN Consulting C "
					+ "ON c.member_num = d.member_num "
					+ "WHERE c.consulting_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consulting_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				consultingDetail = new ConsultingDetailVO();
				consultingDetail.setConsulting_num(consulting_num);
				consultingDetail.setConsulting_date(rs.getDate("consulting_date"));
				consultingDetail.setConsulting_time(rs.getString("consulting_time"));
				consultingDetail.setCon_state(rs.getInt("con_state"));
				consultingDetail.setCon_date(rs.getDate("con_date"));
				consultingDetail.setId(rs.getString("id"));
				consultingDetail.setName(rs.getString("name"));
				consultingDetail.setBirth(rs.getString("birth"));
				consultingDetail.setPhone(rs.getString("phone"));
				consultingDetail.setEmail(rs.getString("email"));
				consultingDetail.setZipcode(rs.getString("zipcode"));
				consultingDetail.setAddress1(rs.getString("address1"));
				consultingDetail.setAddress2(rs.getString("address2"));

			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return consultingDetail;
	}

}
