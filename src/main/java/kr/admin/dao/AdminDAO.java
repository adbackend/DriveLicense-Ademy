package kr.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.admin.vo.AdminVO;
import kr.member.vo.MemberVO;
import kr.util.DBUtil;

/**
 * FileName : AdminDAO.java
 * @date :2021. 9. 9.
 * @author: 筌ㅼ뮇��占쎌젟
 * @description : 1.�꽴占썹뵳�딆쁽 嚥≪뮄�젃占쎌뵥DAO
 */
public class AdminDAO {
	
	private static AdminDAO instance = new AdminDAO();
	
	public static AdminDAO getInstance() {
		return instance;
	}
	
	//嚥≪뮄�젃占쎌뵥
	public AdminVO adminLogin(String admin_id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		AdminVO adminVO = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM admin WHERE admin_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, admin_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				adminVO = new AdminVO();
				
				adminVO.setAdmin_num(rs.getInt("admin_num"));
				adminVO.setAdmin_id(rs.getString("admin_id"));
				adminVO.setAdmin_name(rs.getString("admin_name"));
				adminVO.setAdmin_passwd(rs.getString("admin_passwd"));
				adminVO.setAdmin_auth(rs.getInt("admin_auth"));
			}
			
			
		}catch (Exception e) {
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return adminVO;
	}
	
	//占쎄돌占쎌벥 占쎌젟癰귨옙 占쎈땾占쎌젟
	public void myPageModify(AdminVO adminVO) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql= null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "UPDATE admin SET admin_name=?, admin_passwd=? WHERE admin_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminVO.getAdmin_name());
			pstmt.setString(2, adminVO.getAdmin_passwd());
			pstmt.setInt(3, adminVO.getAdmin_num());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	//占쎌뵬獄쏆꼵占썹뵳�딆쁽 �빊遺쏙옙
	public void adminAdd(AdminVO adminVO) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO admin(admin_num, admin_id, admin_name, admin_passwd, admin_auth ) VALUES (admin_seq.nextVal, ?, ?, ?, ? )";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminVO.getAdmin_id());
			pstmt.setString(2, adminVO.getAdmin_name());
			pstmt.setString(3, adminVO.getAdmin_passwd());
			pstmt.setInt(4, adminVO.getAdmin_auth());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
			
	}
	public int getAdminCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 1;
		
		try {
			conn =DBUtil.getConnection();
			sql ="select count(*) from admin";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;

	}
	
	//�꽴占썹뵳�딆쁽 占쎌읈筌ｏ옙 �뵳�딅뮞占쎈뱜
	public List<AdminVO> adminList(int start, int end) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		AdminVO adminVO = null;
		List<AdminVO> list = null;

		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM "
					+ "(SELECT * FROM admin d "
					+ "ORDER BY DECODE(d.admin_auth,2,1))a) "
					+ "WHERE rnum >= ? AND rnum <= ?";
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminVO>();
			while(rs.next()) {
				
				adminVO = new AdminVO();
				
				adminVO.setAdmin_num(rs.getInt("admin_num"));
				adminVO.setAdmin_id(rs.getString("admin_id"));
				adminVO.setAdmin_name(rs.getString("admin_name"));
				adminVO.setAdmin_auth(rs.getInt("admin_auth"));
				adminVO.setAdmin_passwd(rs.getString("admin_passwd"));
				
				list.add(adminVO);
			}
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public List<MemberVO> memberManageList(int start, int end) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVO> list = null;
		String sql = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql ="select * from (select a.*, rownum rnum from (select * from member_detail d JOIN member m ON d.member_num = m.member_num ORDER BY d.member_num DESC)a) WHERE rnum>=? AND rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MemberVO>();
			while(rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setMember_num(rs.getInt("member_num"));
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setBirth(rs.getString("birth"));
				memberVO.setZipcode(rs.getString("zipcode"));
				memberVO.setAddress1(rs.getString("address1"));
				memberVO.setAddress2(rs.getString("address2"));
				
				list.add(memberVO);
			}
			
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int getMemberCount() throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count =0;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "select count(*) from member_detail d  JOIN member m ON d.member_num=m.member_num";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	public void adminDelete(String admin_id2) throws Exception{
		
		Connection conn= null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "DELETE FROM admin WHERE admin_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, admin_id2);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public void memberDelete(int member_num2) throws Exception{
		
		Connection conn= null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql = null;		
		
		try {
			
			conn = DBUtil.getConnection();
			
			conn.setAutoCommit(false);
			
//			sql = "DELETE FROM member_detail WHERE member_num=?";
//			pstmt2 =conn.prepareStatement(sql);
//			pstmt2.setInt(1, member_num2);
//			pstmt2.executeUpdate();
//			
			sql = "Update member SET auth=0 WHERE member_num=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, member_num2);
			pstmt2.executeUpdate();

			sql = "DELETE FROM member_detail WHERE member_num=?";
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.setInt(1, member_num2);
			pstmt1.executeUpdate();
			
			
			conn.commit();
		}catch (Exception e) {
			conn.rollback();
			throw new Exception(e);			
		}finally {
			DBUtil.executeClose(null, pstmt2, conn);
			DBUtil.executeClose(null, pstmt2, conn);
		}
		
	}

}













