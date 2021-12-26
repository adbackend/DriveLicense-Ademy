package kr.consulting.vo;

import java.sql.Date;

public class ConsultingVO {
	private int consulting_num;
	private int member_num;
	private Date consulting_date;
	private String consulting_time;
	private Date con_date;
	private int con_state;
	private String id;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCon_state() {
		return con_state;
	}
	public void setCon_state(int con_state) {
		this.con_state = con_state;
	}
	public int getConsulting_num() {
		return consulting_num;
	}
	public void setConsulting_num(int consulting_num) {
		this.consulting_num = consulting_num;
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
}
