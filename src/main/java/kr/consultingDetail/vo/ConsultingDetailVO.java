package kr.consultingDetail.vo;

import java.sql.Date;

public class ConsultingDetailVO {
	private int consulting_num;
	private int member_num;
	private Date consulting_date;
	private String consulting_time;
	private Date con_date;
	private int con_state;
	private String id;
	private String name; 
	private String phone;
	private String email;
	private String birth;
	private String zipcode;
	private String address1;
	private String address2;
	
	public int getConsulting_num() {
		return consulting_num;
	}
	public void setConsulting_num(int consultig_num) {
		this.consulting_num = consultig_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public Date getConsulting_date() {
		return consulting_date;
	}
	public void setConsulting_date(Date consulting_date) {
		this.consulting_date = consulting_date;
	}
	public String getConsulting_time() {
		return consulting_time;
	}
	public void setConsulting_time(String consulting_time) {
		this.consulting_time = consulting_time;
	}
	public Date getCon_date() {
		return con_date;
	}
	public void setCon_date(Date con_date) {
		this.con_date = con_date;
	}
	public int getCon_state() {
		return con_state;
	}
	public void setCon_state(int con_state) {
		this.con_state = con_state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
