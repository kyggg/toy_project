package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TechVo {

	private int tech_no;
	private int member_no;
	private String tech_title;
	private String tech_content;
	private int tech_readcount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date tech_date;

	public TechVo() {
		super();
	}

	public TechVo(int tech_no, int member_no, String tech_title, String tech_content, int tech_readcount,
			Date tech_date) {
		super();
		this.tech_no = tech_no;
		this.member_no = member_no;
		this.tech_title = tech_title;
		this.tech_content = tech_content;
		this.tech_readcount = tech_readcount;
		this.tech_date = tech_date;
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

	public String getTech_title() {
		return tech_title;
	}

	public void setTech_title(String tech_title) {
		this.tech_title = tech_title;
	}

	public String getTech_content() {
		return tech_content;
	}

	public void setTech_content(String tech_content) {
		this.tech_content = tech_content;
	}

	public int getTech_readcount() {
		return tech_readcount;
	}

	public void setTech_readcount(int tech_readcount) {
		this.tech_readcount = tech_readcount;
	}

	public Date getTech_date() {
		return tech_date;
	}

	public void setTech_date(Date tech_date) {
		this.tech_date = tech_date;
	}

}
