package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;
import oracle.jdbc.proxy.annotation.Pre;

/**
 * FileName : MemberLoginDAO.java
 * @date :2021. 9. 7.
 * @author: 최유정
 * @description :  1.회원용 회원가입DAO
 *  			   2.회원 로그인DAO 
 * 				   3.나의정보(조회, 삭제, 수정, 탈퇴) DAO  구현
 */
public class MemberDAO {
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}

	
	//최유정------ 회원용 회원가입(insert)
	public void memberJoin(MemberVO memberVO) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0; //시퀀스 번호 저장
		
		try {
			conn = DBUtil.getConnection();
			
			conn.setAutoCommit(false); //오토커밋 해제
			
			sql = "SELECT member_seq.nextval FROM dual";
			pstmt1 = conn.prepareStatement(sql);
			
			rs = pstmt1.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			sql = "INSERT INTO member(member_num, id) VALUES (?, ?)";
			
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, memberVO.getId());
			
			pstmt2.executeUpdate();
			
			System.out.println("테스트: 시퀀스" + num);
			
			sql = "INSERT INTO member_detail(member_num,passwd, name, phone, email, birth, zipcode, address1, address2) VALUES (?,?,?,?,?,?,?,?,?)";
			
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, num);
			pstmt3.setString(2, memberVO.getPasswd());
			pstmt3.setString(3, memberVO.getName());
			pstmt3.setString(4, memberVO.getPhone());
			pstmt3.setString(5, memberVO.getEmail());
			pstmt3.setString(6, memberVO.getBirth());
			pstmt3.setString(7, memberVO.getZipcode());
			pstmt3.setString(8, memberVO.getAddress1());
			pstmt3.setString(9, memberVO.getAddress2());
			
			pstmt3.executeUpdate();
			
			conn.commit();
			
		}catch (Exception e) {
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(rs, pstmt1, conn);
			
		}
	}
	
	public MemberVO checkId(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = null;
		
		MemberVO memberVO = null;
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM member WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setId(rs.getString("id"));
				memberVO.setAuth(rs.getInt("auth"));
			}
			
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return memberVO;
	}
	
	
	
	//최유정---- 회원 로그인insert
	public MemberVO memberLogin(String id) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO memberVO = null;
		
		try {
		
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM member m LEFT OUTER JOIN member_detail d "
					+ "ON m.member_num = d.member_num WHERE m.id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			memberVO = new MemberVO();
			
			if(rs.next()) {
				memberVO.setMember_num(rs.getInt("member_num"));
				memberVO.setAuth(rs.getInt("auth"));
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				
			}
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return memberVO;
	}
	
	
	//회원상세 정보
	public MemberVO memberDetail(int member_num) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberVO memberVO = null;
		
		//<!-- 이름,비밀번호,휴대폰,이메일,생일 우편번호, 주소1,주소2-->
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM member m JOIN member_detail d ON m.member_num=d.member_num WHERE m.member_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				memberVO = new MemberVO();
				
				memberVO.setMember_num(rs.getInt("member_num"));
				memberVO.setId(rs.getString("id"));
				memberVO.setAuth(rs.getInt("auth"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setName(rs.getString("name"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setBirth(rs.getString("birth"));
				
				memberVO.setZipcode(rs.getString("zipcode"));
				memberVO.setAddress1(rs.getString("address1"));
				memberVO.setAddress2(rs.getString("address2"));
				
			}
			
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return memberVO;
	}
	
	//마이페이지 수정
	public void myPageModify(MemberVO memberVO) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = null;
		
		//패스워드,이름, 우편변호,주소1,주소2,이메일, 생년월일, 휴대폰,
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "UPDATE member_detail SET passwd=?, name=?, zipcode=?, address1=?, address2=?, birth=?, phone=? WHERE member_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberVO.getPasswd());
			pstmt.setString(2, memberVO.getName());
			pstmt.setString(3, memberVO.getZipcode());
			pstmt.setString(4, memberVO.getAddress1());
			pstmt.setString(5, memberVO.getAddress2());
			pstmt.setString(6, memberVO.getBirth());
			pstmt.setString(7, memberVO.getPhone());
			pstmt.setInt(8, memberVO.getMember_num());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
	}
	
	public void memberDelete(String id, int member_num) throws Exception{
		
		Connection conn= null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			conn.setAutoCommit(false);
			
			//member auth값 변경 0-탈퇴회원
			sql = "UPDATE member SET auth=0 WHERE id=?";
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.setString(1, id);
			pstmt1.executeUpdate();
			
			sql = "DELETE FROM member_detail WHERE member_num=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, member_num);
			pstmt2.executeUpdate();
			
			conn.commit();
			
		}catch (Exception e) {
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt2, conn);
			DBUtil.executeClose(null, pstmt1, conn);
			
		}
		
	}
	
	
	
	
	
}
