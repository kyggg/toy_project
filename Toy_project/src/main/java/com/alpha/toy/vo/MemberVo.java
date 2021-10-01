package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVo {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	@DateTimeFormat(pattern = "MM-dd")
	private Date member_date;
	
	public MemberVo() {
	}

	public MemberVo(int member_no, String member_id, String member_pw, String member_name, Date member_date) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_date = member_date;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	

	
}
