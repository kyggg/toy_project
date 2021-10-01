package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentVo {

	private int qacomment_no;
	private int member_no;
	private int board_no;
	private String qacomment_content;
	@DateTimeFormat(pattern = "MM-dd")
	private Date qacomment_date;
	
	public CommentVo() {
		super();
	}

	public CommentVo(int qacomment_no, int member_no, int board_no, String qacomment_content,
			Date qacomment_date) {
		super();
		this.qacomment_no = qacomment_no;
		this.member_no = member_no;
		this.board_no = board_no;
		this.qacomment_content = qacomment_content;
		this.qacomment_date = qacomment_date;
	}

	public int getQacomment_no() {
		return qacomment_no;
	}

	public void setQacomment_no(int qacomment_no) {
		this.qacomment_no = qacomment_no;
	}

	
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getQacomment_content() {
		return qacomment_content;
	}

	public void setQacomment_content(String qacomment_content) {
		this.qacomment_content = qacomment_content;
	}

	public Date getQacomment_date() {
		return qacomment_date;
	}

	public void setQacomment_date(Date qacomment_date) {
		this.qacomment_date = qacomment_date;
	}
	
	
}