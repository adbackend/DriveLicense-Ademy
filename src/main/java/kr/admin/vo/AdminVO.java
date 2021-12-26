package kr.admin.vo;

/**
 * FileName : AdminVO.java
 * @date :2021. 9. 9.
 * @author: 최유정
 * @description : 관리자 테이블(admin) VO
 */
public class AdminVO {
	
	private int admin_num; //시퀀스
	private String admin_id;  //관리자 아이디
	private String admin_name; //관리자 이름
	private String admin_passwd; //관리자 비밀번호
	private int admin_auth; // auth 1:일반관리자 2:최고관리자 
	
	
	//비밀번호 일치여부 체크
	public boolean isCheckPassword(String adminPwCheck) {
		if(admin_passwd.equals(adminPwCheck)) {
			return true;
		}
		return false;
	}
	
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	public int getAdmin_auth() {
		return admin_auth;
	}
	public void setAdmin_auth(int admin_auth) {
		this.admin_auth = admin_auth;
	}
	
	
	
	

}
