package kr.member.vo;


/**
 * FileName : MemberVO.java
 * @author: 최유정
 * @date :2021. 9. 6.
 * @description : 회원테이블+회원상세테이블(member+member_detail) VO
 */

public class MemberVO {
	
	private int member_num; //시퀀스
	private int auth;  // 탈퇴0, 일반1
	private String id; //아이디
	
	private String passwd; //비밀번호
	private String name; //이름
	private String phone; //휴대폰
	private String email; //이메일
	private String birth; //생일
	private String zipcode; //우편번호
	private String address1; //주소1
	private String address2; //주소2
	
	
	//비밀번호 일치 여부 체크
	public boolean isCheckPassword(String memberPasswd) {
		
		//탈퇴0,일반1
		if(auth>0 && passwd.equals(memberPasswd)) {
			return true;
		}
		return false;
	}
	
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	
	
	
}
