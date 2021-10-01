package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ApproveVo {

	private int approve_no;
	private int room_no;
	private int member_no;
	private String application_content;
	private String examination;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approve_date;

	public ApproveVo() {
		super();
	}

	public ApproveVo(int approve_no, int room_no, int member_no, String application_content, String examination,
			Date approve_date) {
		super();
		this.approve_no = approve_no;
		this.room_no = room_no;
		this.member_no = member_no;
		this.application_content = application_content;
		this.examination = examination;
		this.approve_date = approve_date;
	}

	public int getApprove_no() {
		return approve_no;
	}

	public void setApprove_no(int approve_no) {
		this.approve_no = approve_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getApplication_content() {
		return application_content;
	}

	public void setApplication_content(String application_content) {
		this.application_content = application_content;
	}

	public String getExamination() {
		return examination;
	}

	public void setExamination(String examination) {
		this.examination = examination;
	}

	public Date getApprove_date() {
		return approve_date;
	}

	public void setApprove_date(Date approve_date) {
		this.approve_date = approve_date;
	}

}
