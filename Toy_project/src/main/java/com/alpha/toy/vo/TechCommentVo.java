package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TechCommentVo {

	private int Tcomment_no;
	private int tech_no;
	private int member_no;
	private String Tcomment_content;
	@DateTimeFormat(pattern = "MM-dd")
	private Date Tcomment_date;
	
	public TechCommentVo() {
	
	}

	public TechCommentVo(int tcomment_no, int tech_no, int member_no, String tcomment_content, Date tcomment_date) {
		super();
		Tcomment_no = tcomment_no;
		this.tech_no = tech_no;
		this.member_no = member_no;
		Tcomment_content = tcomment_content;
		Tcomment_date = tcomment_date;
	}

	public int getTcomment_no() {
		return Tcomment_no;
	}

	public void setTcomment_no(int tcomment_no) {
		Tcomment_no = tcomment_no;
	}

	public int getTech_no() {
		return tech_no;
	}

	public void setTech_no(int tech_no) {
		this.tech_no = tech_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getTcomment_content() {
		return Tcomment_content;
	}

	public void setTcomment_content(String tcomment_content) {
		Tcomment_content = tcomment_content;
	}

	public Date getTcomment_date() {
		return Tcomment_date;
	}

	public void setTcomment_date(Date tcomment_date) {
		Tcomment_date = tcomment_date;
	}
	
	
}
